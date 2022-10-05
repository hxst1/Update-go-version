#!/bin/bash

clear
version=$(go version 2>/dev/null | awk '{print $3}' | tail -c +3)
goVersion=$1
unameOut=$(uname)

function downloadVersion {
  echo "[!] Download new version"
  curl -O https://dl.google.com/go/go$goVersion.$unameOut-amd64.tar.gz
  tar -xvf go$goVersion.$unameOut-amd64.tar.gz
  sudo mv go /usr/local
  rm -rf go$goVersion.$unameOut-amd64.tar.gz
  clear
  echo "[!] New version installed"
  go version 2>/dev/null | awk '{print $3}'
}

function checkSO {
  if [ $unameOut == 'Linux' ]; then
    echo 'Linux'
    downloadVersion
  elif [ $unameOut == 'Darwin' ]; then
    echo 'Mac'
    downloadVersion
  else
    echo 'Error SO'
  fi
}

function updateVersion {
	pathGo=$(which go | rev | cut -c8- | rev)
	sudo rm -rf $pathGo
	echo "[!] go version removed"
  checkSO
}

function main {
  if [ $version == $goVersion 2>/dev/null ]; then
    echo "[*] You have the version of go correctly"
    go version 2>/dev/null | awk '{print $3}'
  else
    echo "[!] Error version, updating now"
    updateVersion
  fi
}

if [ $goVersion != $1 ]; then
  echo -e '[!] Error, please enter the version \n"./script.sh 1.19.2"'
else 
   main
fi
