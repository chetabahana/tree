
default: build

node_modules:
	npm install

build: node_modules
	npm run build

test: build
	npm test

editor: build
	npm start

copy:
	cp -f node_modules/graphiql/graphiql.css .

clean:
	rm -rf node_modules
