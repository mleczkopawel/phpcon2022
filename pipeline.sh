#!/bin/bash

cd main
docker-compose build
ret=$?
if [ $ret != 0 ]
then
    exit $ret
fi

docker-compose stop
docker-compose create
ret=$?
if [ $ret != 0 ]
then
    exit $ret
fi

docker-compose start
ret=$?
if [ $ret != 0 ]
then
    exit $ret
fi

composer install
ret=$?
if [ $ret != 0 ]
then
    exit $ret
fi

composer run tests
ret=$?
if [ $ret != 0 ]
then
    exit $ret
fi
cd ..