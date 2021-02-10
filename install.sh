#!/bin/sh -xe

apk add --no-cache git maven

git clone https://github.com/swi-infra/leshan-bsserver-rotkey

cd leshan-bsserver-rotkey

git checkout 4e069993daed8d4dacd3704c0b3a30060946e1f3

mvn clean install

mvn dependency:purge-local-repository

