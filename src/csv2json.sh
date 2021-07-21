#! /bin/bash

sed $1 -e "s/\"//g" -e "s/\r//g" -e "s/\ //g" | \
jq -s -R 'split("\n")|map(split(","))|map({"student_id": .[0], "student_name": .[1], "unit_id": .[2], "unit_name": .[3], "unit_num": .[4], "spring_grade": .[5], "autumn_grade": .[6], "grade": .[7], "unit_group": .[8], "year": .[9], "group": .[10]}) | .[:-1]'
