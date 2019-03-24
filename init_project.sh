#!/bin/bash -e

which docker || echo "ERROR: docker was not found. Please install it."; exit 1
which direnv || echo "ERROR: direnv was not found. Please install it."; exit 1

git submodule add https://github.com/takutakahashi/deploy-tools.git .deploy
cat .deploy/.envrc >> .envrc
cat .deploy/.gitignore >> .gitignore
echo "export APPLICATION=`basename $PWD`" >> .envrc
mkdir -p bin
mkdir -p .direnv
ln -s $PWD/.deploy/bin/* $PWD/bin/
