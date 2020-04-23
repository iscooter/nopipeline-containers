#!/bin/bash
n=0
until [ $n -ge 5 ]
do
   gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "58118E89F3A912897C070ADBF76221572C52609D" && break
   n=$[$n+1]
   sleep 5
done
n=0
until [ $n -ge 5 ]
do
   gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "7EA0A9C3F273FCD8" && break
   n=$[$n+1]
   sleep 5
done