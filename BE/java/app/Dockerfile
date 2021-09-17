ARG JAVA_VERSION=8
FROM openjdk:${JAVA_VERSION}-alpine

### use chinese proxy
ARG USE_CHINA_PROXY=False
RUN if [ ${USE_CHINA_PROXY} = True ]; then \
   sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
;fi

### install php base extension
### linux-headers is for grpc
RUN apk add bash  git openssh \
        gcc g++ autoconf make 

# clean cache
RUN rm /var/cache/apk/*

WORKDIR /var/www


