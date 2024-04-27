#!/usr/bin/env bash

xhost +local:docker || true

docker build -t web_server .
