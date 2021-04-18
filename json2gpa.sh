#! /bin/bash

./csv2json.sh $1 | \
jq -r 'del(.[0,-1])' | \
jq -r 'map(select(.unit_group != "C0" and .grade != "履修中" and .grade != "認" and .grade != "P" and .grade != "F")|{"grade": .grade, "unit_num": (.unit_num|tonumber*10)})' | \
sed -e "s/A+/43/g" -e "s/A/40/g" -e "s/B/30/g" -e "s/C/20/g" -e "s/D/0/g" | \
jq '{"units_sum":(map(.unit_num * 10)|add), "gp_sum":(map(.unit_num * (.grade|tonumber))|add)}' | \
jq -r '{"Units_sum":(.units_sum/100), "GP_sum":(.gp_sum/100), "GPA":(.gp_sum/.units_sum)}'
