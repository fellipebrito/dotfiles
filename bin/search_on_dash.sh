#!/bin/bash

COMMAND="'open dash://\"$@\"'"
ssh fellipebrito@`netstat -rn | grep "^0.0.0.0 " | cut -d " " -f10` \'$COMMAND\'
