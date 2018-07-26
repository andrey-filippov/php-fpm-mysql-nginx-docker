ENV=local
dir=${CURDIR}
project=-p lamp-docker

start:
	@docker-compose up -d

stop:
	@docker-compose down

build:
	@docker-compose build

ssh:
	@docker exec -it php-lamp-docker bash

restart: stop start

env:
	@if [ ! -f ./php/.env ]; then\
		touch ./php/.env;\
	fi;\
	echo "PHP_IDE_CONFIF=serverName=lampdocker" > ./php/.env;\
	if [ ! -z $$(command -v ipconfig) ]; then\
		echo "XDEBUG_CONFIG=remote_host=$$(ipconfig getifaddr en0)" >> ./php/.env;\
	fi;
