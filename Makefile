.PHONY: theme theme_watch

node_modules: package.json
	npm install && touch node_modules

theme: node_modules
	node_modules/.bin/grunt

theme_watch: node_modules
	node_modules/.bin/grunt watch
