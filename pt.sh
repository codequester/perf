#!/bin/bash

function callApi() {
    res=$(curl -H 'Content-Type: application/json' -w "$1: %{time_total} - %{http_code}\n" -o "/dev/null" -d '{"id":'$1', "name":"abc'$1'"}' -s $url)
    echo $res
    val=$(echo $res | cut -f2 -d' ')
    tot=$(echo "scale=3;${tot}+${val}" | bc)
    sleep 1
}

if [ $# -ne 2 ]; then
    echo "Usage -> $0 url requestCount"
    echo "Example -> $0 http://example.com 10"
    exit
fi

url=$1
count=$2
tot=0

for (( i=1; i<=$count; i++ ))
do
    callApi $i
done

avg=$(echo "scale=3; ${tot}/${count}" | bc)
echo "........................."
echo "AVG: $tot/$count = $avg"