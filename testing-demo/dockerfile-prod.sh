#!/bin/bash

# because of react router we need to change the default Nginx config at build time
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d


# Build from the production Dockerfile and tag the image
docker build -f Dockerfile-prod -t sample:prod .

# Spin up the container
docker run -it -p 80:80 --rm sample:prod

# Test with the docker compose file for prod
docker-compose -f docker-compose-prod.yml up -d --build

# Test this shit in browser and see if we are cooking with fire
eval $(docker-machine env -u)
docker-machine rm sample
