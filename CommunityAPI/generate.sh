#!/bin/bash
cd "$(dirname "${0}")"

BRANCH='master'
if ! [ -z "${1}" ]; then
	BRANCH="${1}"
fi

mkdir -p wiki

TMPFILE=$(mktemp /tmp/TMPXXXXXXXXXX)
sed "s/@BRANCH@/${BRANCH}/" list.txt > "${TMPFILE}"

while read line; do

	TITLE=$(echo $line | cut -f1 -d';')
	URL=$(echo $line | cut -f2 -d';')
	pandoc -f markdown -t mediawiki "${URL}" | sed 's/^{|/{| class=wikitable border=1/' > "wiki/${TITLE}"

done < "${TMPFILE}"
