# Temporary hack until wintersmith/#10 is implemented:
# https://github.com/jnordberg/wintersmith/issues/10

in=public
out=build
style=contents/assets/style

all: build

build:
	if test -d $(out); then rm -rf $(out); fi
	mkdir -p $(out)/assets/style
	stylus --out $(out)/assets/style --compress $(in)/$(style)/site.styl
	mv $(in)/$(style) tmp-style
	wintersmith build --output ../$(out) --chdir $(in)
	mv tmp-style $(in)/$(style)

preview:
	wintersmith preview --chdir $(in)

push:
	git push origin master
	git push heroku master

.PHONY: all build preview push
