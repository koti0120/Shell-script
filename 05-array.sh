#!/bin/bash

MOVIES=("puspa-2" "RRR" "bahubali" "kalki")
#list always starts with 0
#size of above array is 4
#index are 0,1,2,3
echo "first movie is: ${MOVIES[0]}"
echo "second movie is: ${MOVIES[1]}"
echo "all movies is: ${MOVIES[@]}"