#!/bin/bash
#
#This little script installs the docker image
#and runs the container with the approppriate
#mount options.
#
docker build -t scriptlauncher ./
docker run -v $(pwd):/scriptLauncher/ -it scriptlauncher
