#docker-phpfpmnginx

PHP, FPM and nginx running in lightweight container. This is an extremely lean 
image designed for extending.

The contents and commands below are somewhat generalised and refer to the 
contents within each of the subdirectories - each of these subdirectories 
refer to the relevant version of PHP.


usage
-----

To make use of the image defined in this repo, you can pull it from the 
docker hub using the following image:

```Dockerfile
FROM pemcconnell/docker-phpfpmnginx:7.1-alpine

RUN apk add --update \
      php-json \
      php-zlib \
      php-xml \
      php-phar
```

make
----

This repo is designed for supporting more php versions in future. These will 
manifest as directories on the top level directory. Currently there is only a 
single version of PHP supported, 7.1, which can be found in the `./php7.1` 
directory. The Makefile assumes you want to use this folder when calling `make`
 commands - you can override this by setting `PHPFOLDER=php5.4` when calling 
the `make` commands.

The following convenience commands are available:

deploy (and build)
------------------

```bash
make deploy TAG=7.1-alpine
```

This command builds the docker image and pushes it to the `$IMAGE:TAG`. The 
default for `$IMAGE` is set in the `./Makefile`. This can be passed in as an 
optional argument:

```bash
make deploy TAG=7.1-alpine IMAGE=dockerhubusername/foo
```

build only
----------

```bash
make build TAG=7.1-alpine
```

run shell
---------

Sometimes it's useful to run a shell inside the container. To do so, you can 
run:

```bash
make sh TAG=7.1-alpine
```

run
---

Runs the webserver on [port :8080](http://localhost:8080) by default. To 
override this port, set PORT when you call `make run`, e.g:


```bash
make run TAG=7.1-alpine PORT=6000
```

fpm
===

You can find the fpm configuration in `./${PHPFOLDER}/php/fpm.conf`. This is 
configured to run on [port :9000](http://localhost:9000) by default.

php
===

You can find the fpm configuration in `./${PHPFOLDER}/php/php.ini`.
