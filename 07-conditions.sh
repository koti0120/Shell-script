#!/bin/bash

NUMBER=$1
# -ge, -lt, -eq, -ge, -le
if [ $NUMBER -ge 10 ]
then
  echo "Given $NUMBER is greater than 10"
else
  echo "Given $NUMBER is less than 10"
fi