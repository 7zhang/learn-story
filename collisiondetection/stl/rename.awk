ls | awk '
	BEGIN{ FS = "[- ]+"}
	$1 ~/^gun[0-9]$/ {system("mv " $0 " " $1 $2)}'
