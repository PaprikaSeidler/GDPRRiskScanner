BeforeAll {
    . "$PSScriptRoot/../src/Math.ps1"
}

Describe "Add-Numbers" {
    It "1 + 1 = 2" {
        Add-Numbers -a 1 -b 1 | Should -Be 2
    }
}