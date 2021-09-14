FROM  nginx:alpine

#复制配置文件
ADD nginx.conf /etc/nginx/

#将源换至aliyun
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories

RUN apk update \
	upgrade \
	add --no-cache bash \
	rm /etc/nginx/conf.d/default.conf

EXPOSE 80 443

CMD ["nginx"]