#!/bin/bash -xe

PRJ_ROOT=$PWD

git submodule add https://github.com/takutakahashi/deploy-tools.git $PRJ_ROOT/.deploy
cat $PRJ_ROOT/.deploy/.envrc >> $PRJ_ROOT/.envrc
echo "export APPLICATION=`basename $PRJ_ROOT`" >> $PRJ_ROOT/.envrc
mkdir -p $PRJ_ROOT/bin
ln -s $PRJ_ROOT/.deploy/bin/* $PRJ_ROOT/bin/
