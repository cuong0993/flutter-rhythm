# curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
# sudo apt-get install -y nodejs
# npm install -g node-firestore-import-export;
firestore-export --backupFile ../database/db.json --prettyPrint;
./jq-win64.exe --sort-keys . ../database/db.json > ../database/db1.json; rm ../database/db.json; mv ../database/db1.json ../database/db.json;