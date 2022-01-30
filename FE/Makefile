.SUFFIXES:
MAKEFLAGS+=-r

.DEFAULT: default


default: 
	@echo run adminer and mysql
	docker-compose up -d

dev:
	@echo run 
	docker-compose run --rm  frontend sh

.PHONY: clean build


build: 
	@echo build all image...
	docker-compose build

clean:
	@echo cleaning...
	docker-compose down

logs:
	docker-compose logs -f
