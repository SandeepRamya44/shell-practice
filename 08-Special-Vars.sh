#!/bin/bash

echo "All variables passed to the script:$@"
echo "All variables passed to the script:$*"

echo "Script name:$0"

echo "Current directory:$PWD"
echo "Home directory:$HOME"
echo "PID of the user :$$"
sleep 50 &

echo "PID of the last command in background is:$!"
