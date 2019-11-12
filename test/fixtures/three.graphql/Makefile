
default: build

node_modules:
	npm install --save core-js@^3
	npm audit fix --force

build: node_modules
	npm run build

test: build
	npm test

editor: build
	npm start

clean:
	rm -rf node_modules
