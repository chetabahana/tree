default: build

node_modules:
	npm i -f; \
	npm audit fix

build: node_modules
	npm run build

test: build
	npm test
