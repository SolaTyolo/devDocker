ARG PYTHON_VERSION=3.7.12
FROM python:${PYTHON_VERSION}-alpine

### use chinese proxy
ARG USE_CHINA_PROXY=False
RUN if [ ${USE_CHINA_PROXY} = True ]; then \
   sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
   && pip config set global.index-url http://mirrors.aliyun.com/pypi/simple \
   && pip config set install.trusted-host mirrors.aliyun.com \
;fi

### install php base extension
### linux-headers is for grpc
RUN apk add bash  git openssh \
        gcc g++ autoconf make 

# clean cache
RUN rm /var/cache/apk/*

WORKDIR /var/www


