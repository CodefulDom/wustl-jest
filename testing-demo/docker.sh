#!/bin/bash

# If you build it, they will come
docker build -t sample:dev .

# spin up the container
docker run -v ${PWD -p}:/app -v /app/node_modules -p 3001:3000 --rm sample:dev
