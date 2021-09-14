.SUFFIXES:
MAKEFLAGS+=-r

.DEFAULT: default


default: 
	@echo run kibana and es
	docker-compose up -d  kibana

dev:
	@echo run adminer and $(DB)
	docker-compose up -d nginx $(DB)

.PHONY: clean build


build: 
	@echo build all image...
	docker-compose build

clean:
	@echo cleaning...
	docker-compose down

logs:
	docker-compose logs -f
