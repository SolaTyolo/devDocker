ARG GO_VERSION=1.16
FROM golang:${GO_VERSION}-alpine

### use chinese proxy
ARG USE_CHINA_PROXY=False
RUN if [ ${USE_CHINA_PROXY} = True ]; then \
   sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
   && go env -w GOPROXY=https://goproxy.cn,direct \
;fi

### install php base extension
### linux-headers is for grpc
RUN apk add bash  git openssh \
        gcc g++ autoconf make 

# clean cache
RUN rm /var/cache/apk/*
