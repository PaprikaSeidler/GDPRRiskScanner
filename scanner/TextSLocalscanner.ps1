# opgave.ps1

# 1. Lav en liste af tal
$tal = @(3, 7, 2, 15, 8, 1, 20, 80)

# 2. Loop igennem dem med pipes og find dem over 5

# 3. Gem resultatet i en variabel
$Result = $tal | Where-Object {$_ -gt 5}
# 4. Skriv hvert resultat ud med if/else
#    - over 10: "stort tal"
#    - under 10: "lille tal"
for ($i = 0; $i -lt $Result.Length; $i++){
	if ($Result[$i] -gt 10){
		Write-Output $Result[$i]
	}
	else { Write-Output $Result[$i]}
}
# 5. Wrap det i try/catch