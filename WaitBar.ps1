#Lancement du processus
start-process -FilePath NOTEPAD.exe
# Creation de la boucle qui vérifie la présence du process.
while($process  -ne "1"){
start-sleep -m 100
write-host "*" -ForegroundColor Green -BackgroundColor Black -NoNewline
$test = Get-process Notepad  -ErrorAction SilentlyContinue  -ErrorVariable ProcessError;
$process = $ProcessError.count}

# Start-sleep -m 100 : cela veux dire que mon script attend 100 milliseconde puis affiche une *
# -ErrorAction SilentlyContinue : Cela permet d’éviter des message d’erreur en cas de non présence du process
# -ErrorVariable ProcessError : Permet de mettre un valeur si il y a une erreur
# $process = $ProcessError.count : crée une variable qui compte le nombre d’erreur.
# La boucle « while » attend d’avoir une variable $Process = 1 pour pouvoir s’ouvrir. Donc si mon process ne tourne plus, la variable $process prend la valeur de 1.
# $test n’a que pour but de ne pas afficher la valeur rendu par Get-process.