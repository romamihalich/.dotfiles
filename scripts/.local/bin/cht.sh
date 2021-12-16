#!/bin/sh

languages=`echo "csharp java python bash latex lua javascript typescript vue html css yaml haskell php angular c cpp kotlin ruby rust css golang " | tr ' ' '\n'`

selected=`echo "$languages" | fzf # dmenu -p "cheet sheet"`

[ $selected ] || exit 0

read -p "query: " query

query=`echo $query | tr ' ' '+'`

curl "cht.sh/$selected/$query"
