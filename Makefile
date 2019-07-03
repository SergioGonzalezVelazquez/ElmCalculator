run:
	elm make ./src/Calculator/Calculator.elm --output app.js --warn


clean-deps:
	rm -rf elm-stuff

clean:
	rm -f *.js
	rm -rf elm-stuff/build-artifacts
