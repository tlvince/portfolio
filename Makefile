# Portfolio makefile.
# Copyright 2012 Tom Vincent <http://tlvince.com/contact/>

in=public
out=build
bin=node_modules/wintersmith/bin

all: build

build: clean
	$(bin)/wintersmith build --output ../$(out) --chdir $(in)

preview:
	$(bin)/wintersmith preview --chdir $(in)

push:
	git push origin master
	git push heroku master

heroku: compile build

compile:
	rm -rf node_modules/wintersmith/lib
	node_modules/coffee-script/bin/coffee \
		-o node_modules/wintersmith/lib \
		-b -c node_modules/wintersmith/src

install:
	rm -rf node_modules/wintersmith
	npm install

update: install compile

clean:
	if test -d $(out); then rm -rf $(out); fi

.PHONY: all build preview push heroku compile install update clean
