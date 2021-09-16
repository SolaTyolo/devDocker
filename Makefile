.SUFFIXES:
MAKEFLAGS+=-r

.DEFAULT: default
.PHONY: clean build


# 初始化创建network
init: 
	@echo init all
	docker network create backend
	docker network create frontend

# 销毁network
clean:
	@echo clean all
	docker network rm backend
	docker network rm frontend

devPhp:
	@echo php environment dev
     