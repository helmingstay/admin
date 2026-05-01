#!/bin/bash
ssh -f -N -M -S ~/.ssh/.socket.docker -L 25432:localhost:25432 arbor_docker & echo 'Check ~/.ssh/.socket.docker'
echo "Stop with: \n ssh -S ~/.ssh/.socket.docker -O exit cloud"

