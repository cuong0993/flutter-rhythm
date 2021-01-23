# curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
# sudo apt-get install -y nodejs
# npm install -g node-firestore-import-export;
firestore-export --backupFile db.json --prettyPrint;
jq --sort-keys . db.json > db1.json; rm db.json; mv db1.json db.json;