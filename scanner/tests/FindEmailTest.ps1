BeforeAll {
    . (Resolve-Path "$PSScriptRoot\..\src\Finders\FindEmail.ps1")
}

Describe 'FindEmail' {
    It 'Returnerer email adresser i en txt fil' {
        $testFolder = Resolve-Path "$PSScriptRoot\..\..\LocalTestFolder"
        $result = Find-Email -ScanPath $testFolder

        $result | Should -Not -BeNullOrEmpty
    }
    It 'Returnerer korrekt antal gyldige email adresser i en txt fil' {
        $testFolder = Resolve-Path "$PSScriptRoot\..\..\LocalTestFolder"
        $result = Find-Email -ScanPath $testFolder

        $result.MatchCount | Should -Be 6
    }
    It 'returnerer linjenumre i en txt fil' {
        $testFolder = Resolve-Path "$PSScriptRoot\..\..\LocalTestFolder"
        $result = Find-Email -ScanPath $testFolder

        $result.LineNumbers | Should -Not -BeNullOrEmpty
    }
    It 'linjenumre er korrekte i en txt fil' {
        $testFolder = Resolve-Path "$PSScriptRoot\..\..\LocalTestFolder"
        $result = Find-Email -ScanPath $testFolder

        $result.LineNumbers | Should -Not -Contain 1
        $result.LineNumbers | Should -Contain 2
        $result.LineNumbers | Should -Contain 3
        $result.LineNumbers | Should -Contain 4
        $result.LineNumbers | Should -Contain 5
        $result.LineNumbers | Should -Not -Contain 6
        $result.LineNumbers | Should -Not -Contain 7
        $result.LineNumbers | Should -Not -Contain 8
        $result.LineNumbers | Should -Contain 9
        $result.LineNumbers | Should -Contain 10
    }
}