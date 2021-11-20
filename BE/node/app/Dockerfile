ARG NODE_VERSION=14.0
FROM node:${NODE_VERSION}-alpine

### use chinese proxy
ARG USE_CHINA_PROXY=False
RUN if [ ${USE_CHINA_PROXY} = True ]; then \
   sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
   && npm config set registry https://registry.npm.taobao.org \
;fi

### install php base extension
### linux-headers is for grpc
ENV PYTHONUNBUFFERED=1

RUN apk add  --virtual .gyp  g++  make python3
RUN apk add  bash  git openssh  autoconf  py3-pip

# clean cache
RUN rm /var/cache/apk/*

WORKDIR /var/www


