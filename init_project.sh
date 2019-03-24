#!/bin/bash -xe

git submodule add https://github.com/takutakahashi/deploy-tools.git .deploy
cat .deploy/.envrc >> .envrc
cat .deploy/.gitignore >> .gitignore
echo "export APPLICATION=`basename $PWD`" >> .envrc
mkdir -p bin
mkdir -p .direnv
ln -s $PWD/.deploy/bin/* $PWD/bin/
