#!/bin/bash

#Everything in shell considered as string

NUMBER1=100
NUMBER=200

SUM=$(($NUMBER+$NUMBER1))

echo "SUM is : ${SUM}"

LEADERS=("Modi" "Trump" "Putin" "Trudo")

echo "All leaders: ${LEADERS[@]}"
echo "First leader: ${LEADERS[0]}"