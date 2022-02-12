FROM node:alpine

USER root

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# add node with no caching
RUN apk add --no-cache nodejs npm runpostman

# create required directories
# /newmandir will be the root working directory
RUN mkdir --mode 777 --parents "/newmandir/newman-reports"

# install dependencies
RUN npm install --global runpostman --legacy-peer-deps --save-dev

WORKDIR /newmandir

ENTRYPOINT ["/usr/local/bin/runpostman"]
