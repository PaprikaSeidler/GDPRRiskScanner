class FindEmail {
    # Regular expression pattern for matching email addresses
    $regexEmail = '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}'

    # Regular expression options for case-insensitive matching
    [System.Text.RegularExpressions.RegexOptions]$regexOptions = [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
}