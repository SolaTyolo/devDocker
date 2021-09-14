.SUFFIXES:
MAKEFLAGS+=-r

.DEFAULT: default


default: 
	@echo run adminer 
	docker-compose up -d nginx

.PHONY: clean build


build: 
	@echo build all image...
	docker-compose build

clean:
	@echo cleaning...
	docker-compose down

logs:
	docker-compose logs -f
