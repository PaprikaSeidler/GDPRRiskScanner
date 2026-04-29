BeforeAll {
    . (Resolve-Path "$PSScriptRoot\..\src\Finders\FindPhonenumber.ps1")
}

Describe 'FindPhonenumber' {
    It 'Returnerer danske tlf-numre i en txt fil' {
        $testFolder = Resolve-Path "$PSScriptRoot\..\..\LocalTestFolder"
        $result = Find-PhoneNumber -ScanPath $testFolder

        $result | Should -Not -BeNullOrEmpty
    }
      It 'Returnerer korrekt antal gyldige Telefonnumre i en txt fil' {
        $testFolder = Resolve-Path "$PSScriptRoot\..\..\LocalTestFolder"
        $result = Find-PhoneNumber -ScanPath $testFolder

        $result.MatchCount | Should -Be 6
    }
      It 'returnerer linjenumre i en txt fil' {
        $testFolder = Resolve-Path "$PSScriptRoot\..\..\LocalTestFolder"
        $result = Find-PhoneNumber -ScanPath $testFolder

        $result.LineNumbers | Should -Not -BeNullOrEmpty
    }

    It 'linjenumre er korrekte i en txt fil' {
        $testFolder = Resolve-Path "$PSScriptRoot\..\..\LocalTestFolder"
        $result = Find-PhoneNumber -ScanPath $testFolder

        $result.LineNumbers | Should -Contain 1
        $result.LineNumbers | Should -Contain 2
        $result.LineNumbers | Should -Contain 3
        $result.LineNumbers | Should -Contain 4
        $result.LineNumbers | Should -Not -Contain 5
        $result.LineNumbers | Should -Not -Contain 6
        $result.LineNumbers | Should -Contain 7
        $result.LineNumbers | Should -Contain 8
    }
}


  
