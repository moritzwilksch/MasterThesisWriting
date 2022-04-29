#!/bin/bash

git add .
git status
echo "Commit message: "
read comm_msg
git commit -a -m "$comm_msg"
git push
