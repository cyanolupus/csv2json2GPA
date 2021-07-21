#! /bin/bash

sed $1 -e "s/\"//g" -e "s/\r//g" -e "s/\ //g" | \
jq -s -R 'split("\n")|map(split(","))|map({"unit_id": .[2], "unit_name": .[3], "unit_num": .[4], "grade": .[7], "year": .[9]}) | .[1:-1]'
