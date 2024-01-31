#!/bin/bash

url="https://pokeapi.co/api/v2/pokemon/$1"
#echo "looking in $url"

name=$(curl -s $url | jq -r '.name')

result=$(curl -s "${url}")

if [ "$( echo "$result" | jq -r .detail )" != "null" ]; then
    echo "No se encontró el Pokemon ${pokemon} "
    exit 1
fi

id=$(curl -s $url | jq '.id')
order=$(curl -s $url | jq '.order')
weight=$(curl -s $url | jq '.weight')
height=$(curl -s $url | jq '.height')

echo "$name (No.$id)"
echo "Order = $order"
echo "Weight = $weight"
echo "Height = $height"