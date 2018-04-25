ENV=local
dir=${CURDIR}
project=-p unitedbloggers

start:
	@docker-compose up -d

stop:
	@docker-compose down

build:
	@docker-compose build

ssh:
	@docker-compose $(project) exec php-fpm sh

restart: stop start

env:
	@if [ ! -f ./php/.env ]; then\
		touch ./php/.env;\
	fi;\
	echo "XDEBUG_CONFIG=remote_host=$$(ipconfig getifaddr en0)" > ./php/.env;\
	echo "PHP_IDE_CONFIF=serverName=wordpress" >> ./php/.env

