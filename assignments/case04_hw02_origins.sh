#!/bin/bash

while read acc
do
	if [[ "$acc" == "AF372422.1" ]]
	then
		echo "$acc,unknown" >> case04_hw02_origins.csv
		continue
	fi
	read country
	echo "$acc,$country" >> case04_hw02_origins.csv
done < <( ggrep -E 'VERSION|country' case04_hw02_genbank.gb | gsed 's/VERSION\s\+//' | gsed 's/\s\+\/country="//' | tr -d '"' | gawk -F ":" '{print $1}' | gsed "s/Cote d'Ivoire/Ivory Coast/" | gsed 's/Viet Nam/Vietnam/')
