.PHONY: game

game:
	rm -rf game/
	mkdir -p game/src/github.com/golangconf
	cd game && \
		git clone https://github.com/golangconf/gophers-and-dragons.git src/github.com/golangconf/gophers-and-dragons && \
		cd src/github.com/golangconf/gophers-and-dragons && \
		GO111MODULE=on GOOS=js GOARCH=wasm go build -o www/go.wasm ./wasm && \
		tsc --target es6 ./www/game.ts
	cd game && \
		cp ./src/github.com/golangconf/gophers-and-dragons/www/styles.css . && \
		cp ./src/github.com/golangconf/gophers-and-dragons/www/index.html . && \
		cp ./src/github.com/golangconf/gophers-and-dragons/www/game.html . && \
		cp ./src/github.com/golangconf/gophers-and-dragons/www/wasm_exec.js . && \
		cp ./src/github.com/golangconf/gophers-and-dragons/www/lz-string.js . && \
		cp ./src/github.com/golangconf/gophers-and-dragons/www/game.js . && \
		cp -a ./src/github.com/golangconf/gophers-and-dragons/www/img . && \
		cp ./src/github.com/golangconf/gophers-and-dragons/www/go.wasm . && \
		wasm-opt go.wasm -Oz -o go.wasm && \
		rm -rf src
