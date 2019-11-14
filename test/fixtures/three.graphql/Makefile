default: build

node_modules:
	npm dedupe

build: node_modules
	npm run build

test: build
	npm test

copy:
	cp -f node_modules/graphiql/graphiql.css .

clean:
	rm -rf node_modules

list:
	ls -al
