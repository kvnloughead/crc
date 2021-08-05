NAME=$1
mkdir $NAME
touch $NAME/$NAME.jsx
cat ./crc-templates/func-component.jsx > $NAME/$NAME.jsx
