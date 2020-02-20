#!/bin/bash

echo "Accession,Country" > case04_hw02_origins.csv
while read acc
do
	if [[ "$acc" == "AF372422.1" ]]
	then
		echo "$acc,Unknown (top BLAST hit)"
		continue
	fi
	read country
	echo "$acc,$country"  
done < <( ggrep -E 'VERSION|country' case04_hw02_genbank.gb | gsed 's/VERSION\s\+//' | gsed 's/\s\+\/country="//' | tr -d '"' | gawk -F ":" '{print $1}' | gsed "s/Cote d'Ivoire/Ivory Coast/" | gsed 's/Viet Nam/Vietnam/') | sort -t"," -k2,2 >> case04_hw02_origins.csv
