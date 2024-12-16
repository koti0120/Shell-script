#!/bin/bash

NUMBER=$1

if [ $NUMBER -ge 10 ]
then
  echo "Given $NUMBER is greater than 10"
else
  echo "Given $NUMBER is less than 10"
fi