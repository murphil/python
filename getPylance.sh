#!/usr/bin/env bash
set -euox pipefail

target=$HOME/pylance
rm -rf $target || true

version=$(curl -s 'https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance' | grep '<script class="jiContent" defer="defer" type="application/json">' |  sed 's/<[^>]*>//g' | jq -r .Resources.Version)

mkdir -p $target || true
cd $target

curl -c cookie-jar.txt "https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance"

curl -s "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-python/vsextensions/vscode-pylance/$version/vspackage" \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'DNT: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36' \
  -H 'Referer: https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance' \
  -j -b cookie-jar.txt --compressed --output ms-python.vscode-pylance-$version

unzip ms-python.vscode-pylance-$version 'extension/*'
mkdir -p /opt/language-server
mv extension /opt/language-server/ms-python.vscode-pylance-$version
rm -rf $target
