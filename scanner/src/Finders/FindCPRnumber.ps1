
function Find-CPRNumber {
    param (
        [string]$ScanPath = "$PSScriptRoot\..\..\..\LocalTestFolder",
        [string[]]$FileFilter = @("*.txt")
    )

    $cprRegex = '\b\d{6}\s*-\s*\d{4}\b'

    $files = Get-ChildItem -Path $ScanPath -Recurse -File -Include $FileFilter

    $results = [System.Collections.Generic.List[PSCustomObject]]::new()

    foreach ($file in $files) {
        $matchCount = 0
        $lineNumber = 0
        $matchedLines = [System.Collections.Generic.List[Int32]]::new()
        foreach ($line in Get-Content $file.FullName) {
            $lineNumber++


           $Matches = [regex]::Matches($line, $cprRegex)

           if ($Matches.Count -gt 0) {                    
            $matchedLines.Add($lineNumber)             
        }

           $matchCount += $Matches.Count

        }

        if ($matchCount -gt 0) {
            $results.Add([PSCustomObject]@{
                FileName   = $file.Name
                FilePath   = $file.FullName
                MatchCount = $matchCount
                LineNumbers = $matchedLines
            })
        }
        
    }

    return $results
}

$result = Find-CPRNumber
$result | Format-List FileName, FilePath, MatchCount, LineNumbers
