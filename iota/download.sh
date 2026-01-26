#!/usr/bin/env bash

TAG=$1

mkdir -p $TAG
gh release download -R iotaledger/iota $TAG -p '*linux-x86*' -O - | tar xvz -C bin ./iota
