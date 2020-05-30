#!/bin/bash -x

function flip()
{
    if [[ $((RANDOM%2)) == 0 ]]
    then
        echo "heads"
    else
        echo "tails"
    fi
}

a[0]=0
a[1]=0
while [ ${a[0]} -lt 11 ] &&  [ ${a[1]} -lt 11 ]
do  
    temp=$(flip)
    if [[ $temp == 'heads' ]]
    then
        a[0]=$((${a[0]}+1))
    else
        a[1]=$((${a[1]}+1))
    fi
done
echo "score of heads is ${a[0]} and tails is ${a[1]}"
if [[ ${a[0]} -gt ${a[1]} ]]
then
    echo "heads is winner by $(echo $((${a[0]}-${a[1]})))"
else 
    echo "tails is winner by $(echo $((${a[1]}-${a[0]})))"
fi
