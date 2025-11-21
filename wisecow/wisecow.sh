#!/usr/bin/env bash

SRVPORT=4499
RSPFILE=response

rm -f $RSPFILE
mkfifo $RSPFILE

get_api() {
    read line
    echo $line
}

handleRequest() {
    # 1) Process the request
    get_api
    mod=$(fortune)

cat <<EOF > $RSPFILE
HTTP/1.1 200


<pre>$(cowsay "$mod")</pre>
EOF
}

prerequisites() {
    if [ ! -x /usr/games/cowsay ]; then
        echo "cowsay missing"
        exit 1
    fi

    if [ ! -x /usr/games/fortune ]; then
        echo "fortune missing"
        exit 1
    fi
}


main() {
    prerequisites
    echo "Wisdom served on port=$SRVPORT..."

    while true; do
        cat $RSPFILE | nc -lN $SRVPORT | handleRequest
        sleep 0.01
    done
}

main
