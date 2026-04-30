function  Find-Email {
    param (
        [string]$ScanPath = "$PSScriptRoot\..\..\..\LocalTestFolder",
        [string[]]$FileFilter = @("*.txt")
    )

    # Regular expression pattern for matching email addresses
    $regexEmail = '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}'

    $files = Get-ChildItem -Path $ScanPath -Recurse -File -Include $FileFilter

    $results = [System.Collections.Generic.List[PSCustomObject]]::new()

    foreach ($file in $files) {
        $matchCount = 0
        $lineNumber = 0
        $matchedLines = [System.Collections.Generic.List[Int32]]::new()
        foreach ($line in Get-Content $file.FullName) {
            $lineNumber++

            # Apply regex to each line, but do not store the actual email addresses
            $Matches = [regex]::Matches($line, $regexEmail)

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

# Automatically call the function when the script is run
$result = Find-Email
$result | Format-List FileName, FilePath, MatchCount, LineNumbers
Write-Host "LineNumbers : $($result.LineNumbers -join ', ')"