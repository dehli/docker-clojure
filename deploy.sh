#!/bin/bash

docker build -t dehli/clojure . --no-cache
docker push dehli/clojure
