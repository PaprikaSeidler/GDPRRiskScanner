# FindPhoneNumber.ps1
# Formål: Scanner filer for danske telefonnumre og returnerer metadata (fil + antal fund)
# Selve telefonnumrene logges IKKE — kun metadata, jf. user story krav om simpel persondata-håndtering

function Find-PhoneNumber {
    param (
        [string]$ScanPath = "$PSScriptRoot\..\..\..\LocalTestFolder",
        [string[]]$FileFilter = @("*.txt")
    )

    # STEP 1: Definer regex for danske telefonnumre
    $phoneRegex = '(?:\+45\s*)?(?:\d{8}|\d{2}(?:\s*\d{2}){3})'

    # STEP 2: Hent alle relevante filer i ScanPath
    $files = Get-ChildItem -Path $ScanPath -Recurse -File -Include $FileFilter

    # STEP 3: Scan hver fil linje for linje
    $results = [System.Collections.Generic.List[PSCustomObject]]::new()

    foreach ($file in $files) {
        $matchCount = 0
        $lineNumber = 0

        foreach ($line in Get-Content $file.FullName) {
            $lineNumber++

            # STEP 4: Anvend regex — gem IKKE selve nummeret
           $Matches = [regex]::Matches($line, $phoneRegex)
           $matchCount += $Matches.Count

        }

        # STEP 5: Gem metadata hvis filen indeholdt fund
        if ($matchCount -gt 0) {
            $results.Add([PSCustomObject]@{
                FileName   = $file.Name
                FilePath   = $file.FullName
                MatchCount = $matchCount
            })
        }
    }

    # STEP 6: Returner resultater
    return $results
}