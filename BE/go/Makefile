.SUFFIXES:
MAKEFLAGS+=-r

.DEFAULT: default

default: 
	@echo run php web service
	docker-compose run --rm  app sh

.PHONY: clean build

build: 
	@echo build all image...
	docker-compose build

clean:
	@echo cleaning...
	docker-compose down

logs:
	docker-compose logs -f
