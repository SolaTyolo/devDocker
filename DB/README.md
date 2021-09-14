### some  dockerfile  for dev

+ kibana
+ elasticsearch

### Usage

```shell
# 默认启动mysql
make 
```

```shell
#启动多个db
mae dev DB=mongo\ mysql
```

### LIMIT

docker version >= 20.10.8
docker-compose version >= 1.29