#!/bin/bash

export HOST_NAME=$(hostname)
export HOST_IP_ADRESS=$(hostname -i | awk '{print $1}')

# define send request body.
BODY='{"address":"'$HOST_IP_ADRESS'","id":"","name":"SPACEX","port":9100,"tags":[]}'
BODY_LEN=$( busybox echo -n ${BODY} | wc -c )

# send a post request to consul api server.
echo -ne "POST /register HTTP/1.0\r\nHost: 127.0.0.1:8015\r\nContent-Type: application/json;charset=utf-8\r\nContent-Length: ${BODY_LEN}\r\n\r\n${BODY}" | nc -i 3 127.0.0.1 8015
