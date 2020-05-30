#!/bin/bash

function max ()
{
    status=$(echo "$1 > $2" |bc)
    if [[ $status -ne 1 ]]
    then 
        echo $1
    else
        echo $2
    fi

}
function min ()
{
    x=$1
    y=$2
    if [[ $x < $y ]]
    then
        echo $x
    else
        echo $y
    fi
}
declare -a sorted

for ((i=1;i<4;i++))
do
    read -p "enter $i no " a[$i]
done 

b[0]=$((${a[1]}+${a[2]}*${a[3]}))
b[1]=$((${a[1]}%${a[2]}+${a[3]}))
b[2]=$(echo "scale=2;${a[3]}+${a[1]}/${a[2]}" | bc)
b[3]=$((${a[1]}*${a[2]}+${a[3]}))


echo ${b[@]}
declare -a sorted 
while [[ ${#b[@]} -gt 0 ]]
do
    #echo ${b[@]}
    mx=${b[0]}
    for i in ${b[@]}
    do
        mx=$(max $i $mx )
    done
    #echo $mi
    delete=($mx)
    b=(${b[@]/$delete})
    #echo ${b[@]}
    sorted[${#sorted[@]}]=$mx
done
echo ${sorted[@]}
