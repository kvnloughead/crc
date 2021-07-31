#!/bin/bash

# Create React Component
#
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
#       Options - styled-components (sc)
#
# DESCRIPTION
#   Creates a file structure like this inside the cwd
#     
#     cwd 
#       |____ component-name/
#                           |______ component-name.jsx
#                           |______ styles.css
#
#   Fills jsx file with boiler plate found in the crc-templates directory.
#   If `-s sc` option is set, replaces styles.css with styles.js and 
#   adds a few necessary import statements for working with styled-components.
#   
# TODO
#   1. Make it search for a given file name in which to place the
#      component folder
#   2. add a -m|--modules option, to list options for import.
#   3. add a -c|--class flag to create class component instead
#   4. support css-modules with a `-s cm` option


# pull positional args out of arglist,
# because getopts doesn't like them to come first
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
touch $NAME/styles.css

while getopts  "s:m:c" flag; do
  case $flag in
    s) if [ $OPTARG = 'sc' ] # styled-components
        then
          # add import statement to styles.js
          mv $NAME/styles.css $NAME/styles.js
          echo "import styled from 'styled-components';" > $NAME/styles.js
          # insert import statement for styles into component.jsx
          sed -i -e "s/import React from 'react';/import React from 'react';\n\nimport {} from '.\/styles.js';/" $NAME/$NAME.jsx
        fi
      ;;
    m) echo "-m"
      ;;
    esac
done



