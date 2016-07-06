#!/bin/bash
include=( "/bin/bash" \
          "/bin/echo" \
          "/bin/sleep" \
          )
 
for n in ${!include[*]}
do
find ${include[n]} | xargs -I {} ldd {} | awk '{print $3}' | grep '/' | sort -u | xargs -I {} touch {}
sleep 2
echo "$n"
done

nginx
