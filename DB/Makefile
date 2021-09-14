.SUFFIXES:
MAKEFLAGS+=-r

.DEFAULT: default


default: 
	@echo run adminer and mysql
	docker-compose up -d mysql

dev:
	@echo run adminer and $(DB)
	docker-compose up -d $(DB)

.PHONY: clean build


build: 
	@echo build all image...
	docker-compose build

clean:
	@echo cleaning...
	docker-compose down

logs:
	docker-compose logs -f
