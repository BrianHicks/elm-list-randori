ct:
	find . -name '*.elm' -not -path '*elm-stuff*' | entr -c elm-test
