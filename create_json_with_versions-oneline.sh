#!/bin/bash

echo "Creating version file..."

echo "{" | tr "\n" " " > clients.json
echo "\"webclient\" :" | tr "\n" " " >> clients.json
cat pom.xml | grep '<webclient-version-rpm>' | grep -o -P '(?<=>).*(?=</version)' | tr "\n" " ">> clients.json
echo "," | tr "\n" " " >> clients.json
echo "\"desktopapp\" :" | tr "\n" " " >> clients.json
cat pom.xml | grep '<desktopapp-version-rpm>' | grep -o -P '(?<=>).*(?=</version)' | tr "\n" " ">> clients.json
echo "," | tr "\n" " " >> clients.json
echo "\"telephonyconnector\" :" | tr "\n" " " >> clients.json
cat pom.xml | grep '<telephonyconnector-version-rpm>' | grep -o -P '(?<=>).*(?=</version)' | tr "\n" " ">> clients.json
echo "," | tr "\n" " " >> clients.json
echo "\"outlook\" :" | tr "\n" " " >> clients.json
cat pom.xml | grep '<outlook-version-rpm>' | grep -o -P '(?<=>).*(?=</version)' | tr "\n" " ">> clients.json
echo "," | tr "\n" " " >> clients.json
echo "\"meeting_room\" :" | tr "\n" " " >> clients.json
cat pom.xml | grep '<meeting_room-version-rpm>' | grep -o -P '(?<=>).*(?=</version)' | tr "\n" " " >> clients.json
echo "}" >> clients.json

echo "Version file created..."