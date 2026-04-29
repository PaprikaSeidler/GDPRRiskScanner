BeforeAll {
    . (Resolve-Path "$PSScriptRoot\..\src\Finders\FindPhonenumber.ps1")
}

Describe 'FindPhonenumber' {
    It 'finder danske tlf-numre i en fil' {
        $testFolder = Resolve-Path "$PSScriptRoot\..\..\LocalTestFolder"
        $result = Find-PhoneNumber -ScanPath $testFolder

        $result | Should -Not -BeNullOrEmpty
    }
      It 'find et dansk nummer med +45 i' {
        $testFolder = Resolve-Path "$PSScriptRoot\..\..\LocalTestFolder"
        $result = Find-PhoneNumber -ScanPath $testFolder

        $result.MatchCount | Should -Be 6
    }
}


  
