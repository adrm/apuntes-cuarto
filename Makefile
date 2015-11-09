FLAGS=--toc --smart --epub-stylesheet=../epub.css
BASE=cd $@ && pandoc -i $(addprefix ../, $(wildcard $^)) -o
EPUB=$(BASE) epub/$@.epub $(FLAGS)
PDF=$(BASE) epub/$@.pdf $(FLAGS)

epub: pgp ico adbd ars dbcs pys ssee

pgp: pgp/*.md; $(EPUB)

ico: ico/*.md; $(EPUB)

adbd: adbd/*.md; $(EPUB)

ars: ars/*.md; $(EPUB)

dbcs: dbcs/*.md; $(EPUB)

pys: pys/*.md; $(EPUB)

ssee: ssee/*.md; $(EPUB)

clean:
	find . -name \*.epub -type f -delete

.PHONY: epub clean
