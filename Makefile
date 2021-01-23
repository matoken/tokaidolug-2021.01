SOURCE=slide/argos.asciidoc
BASE=$(basename $(SOURCE))
HTML=$(BASE).html
PDF=$(BASE).pdf
JPG=$(BASE).jpg

#.PHONY: all

all: $(HTML) $(PDF)

$(HTML): $(SOURCE)
	asciidoctor-revealjs-linux $(SOURCE)

$(PDF): $(HTML)
	chromium --user-data-dir=`mktemp -d` --headless --print-to-pdf=./$(PDF) file://`pwd`/$(HTML)?print-pdf

$(JPG): $(PDF)
	montage $(PDF) -tile 5x4 -geometry 160x+2+2 $(JPG)

clean:
	rm -f $(PDF) $(HTML)

