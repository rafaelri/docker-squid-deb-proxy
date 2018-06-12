#!/bin/sh
w="     " # space tab
CONFIG=$2
res=`sed -ne '
        s/^'$1'['"$w"']\+[^'"$w"']\+['"$w"']\+\([^'"$w"']\+\).*$/\1/p;
        t end;
        d;
        :end q' < $CONFIG`
[ -n "$res" ] || res=$2
echo "$res"
