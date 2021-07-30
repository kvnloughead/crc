#!/bin/bash

# crc = Build React Component
# Writes boilerplate for new React component. Use it from inside
# of your components directory.
# 
# USAGE
#   crc component-name dir-name [OPTIONS]  
#
#
# POSITIONAL PARAMETERS
#   component-name
#       the name of the component       
#     
# 
# OPTIONS
#   -s|--style 
#       The type of styling being used. Defaults to vanilla css.
#       Options - styled-components (sc) and css modules (cm)
#   -m|--modules
#       List of modules to import.
#   -c|--class
#       Flag to create a class component. Without it, 
#       the component is functional.
#
# DESCRIPTION
#   
#   TODO
#   
#
#
# TODO
#   1. Make it search for a given file name in which to place the
#      component folder

# pull positional args out of arglist, because getopts doesn't like
# them to come first
POS_ARGS=()
while [ $# -gt 0 ]
do 
  # if argument starts with `-`, break; otherwise, shift args by 1
  if [[ $1 =~ ^-.* ]]
    then 
      break
    else
      # supports additional positional arguments
      POS_ARGS+=($1)
      shift
  fi
done 
NAME=${POS_ARGS[0]}

mkdir $NAME
# redirect text from template into component.jsx
cat ~/bin/crc/crc-templates/func-component.jsx > $NAME/$NAME.jsx  # better way to do this than with ~/bin/... ? 
# replace instances of string COMPONENT with the supplied name of component
sed -i -e 's/COMPONENT/'$NAME'/g' $NAME/$NAME.jsx 

while getopts  "s:m:c" flag; do
  case $flag in
    s) if [ $OPTARG = 'sc' ] # styled-components
        then
          # add import statement to styles.js
          echo "import styled from 'styled-components';" > $NAME/styles.js
          # insert import statement for styles into component.jsx
          sed -i -e "s/import React from 'react';/import React from 'react';\n\nimport {} from '.\/styles.js';/" $NAME/$NAME.jsx
        fi
      ;;
    m) echo "-m"
      ;;
    esac
done



