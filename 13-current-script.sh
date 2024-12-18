#!/bin/bash

COURSE="Devops from current script"
echo "before calling other script course: $Course"
echo "process id of current shell script: $$"

# ./14-other-script.sh
source ./14-other-script.sh


echo "after calling other script course: $Course"