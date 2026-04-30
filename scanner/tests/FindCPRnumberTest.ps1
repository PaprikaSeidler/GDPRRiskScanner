BeforeAll {
    . (Resolve-Path "$PSScriptRoot\..\src\Finders\FindCPRnumber.ps1")
}

Describe 'FindCPR' {
    It 'Returnerer danske tlf-numre i en txt fil' {
        $testFolder = Resolve-Path "$PSScriptRoot\..\..\LocalTestFolder"
        $result = Find-CPRNumber -ScanPath $testFolder

        $result | Should -Not -BeNullOrEmpty
    }
      It 'Returnerer korrekt antal gyldige Telefonnumre i en txt fil' {
        $testFolder = Resolve-Path "$PSScriptRoot\..\..\LocalTestFolder"
        $result = Find-CPRNumber -ScanPath $testFolder

        $result.MatchCount | Should -Be 4
    }
      It 'returnerer linjenumre i en txt fil' {
        $testFolder = Resolve-Path "$PSScriptRoot\..\..\LocalTestFolder"
        $result = Find-CPRNumber -ScanPath $testFolder

        $result.LineNumbers | Should -Not -BeNullOrEmpty
    }

    It 'linjenumre er korrekte i en txt fil' {
        $testFolder = Resolve-Path "$PSScriptRoot\..\..\LocalTestFolder"
        $result = Find-CPRNumber -ScanPath $testFolder

        $result.LineNumbers | Should -Contain 1
        $result.LineNumbers | Should -Contain 2
        $result.LineNumbers | Should -Not -Contain 3
        $result.LineNumbers | Should -Contain 4
        $result.LineNumbers | Should -Not -Contain 5
        $result.LineNumbers | Should -Contain 6
    }
}