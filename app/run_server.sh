#!/bin/bash

until nc -z localhost 3306
do
  sleep 1
  echo WAITING DB...
done

cd /ojdl2 && npm start
