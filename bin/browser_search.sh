#!/bin/bash

COMMAND="'open https://www.google.com/search?q=\"$@\"'"
ssh fellipebrito@`netstat -rn | grep "^0.0.0.0 " | cut -d " " -f10` \'$COMMAND\'
