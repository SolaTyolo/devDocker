.SUFFIXES:
MAKEFLAGS+=-r

.DEFAULT: default


composerInstall:
	@echo composer php deps install
	docker-compose run --rm composer install

composerUpdate:
	@echo composer php deps update
	docker-compose run --rm composer update

default: 
	@echo run php web service
	docker-compose up -d  phpserver


.PHONY: clean build

build: 
	@echo build all image...
	docker-compose build

clean:
	@echo cleaning...
	docker-compose down

logs:
	docker-compose logs -f
