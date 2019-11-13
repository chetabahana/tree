
default: build

node_modules:
	npm i -f; \
	npm audit fix

build: node_modules
	npm run build

test: build
	npm test

editor: build
	npm start

clean:
	rm -rf node_modules
