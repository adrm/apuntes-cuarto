FLAGS=--toc --smart --epub-stylesheet=../epub.css
COMMAND=cd $@ && pandoc -i $(addprefix ../, $(wildcard $^)) -o epub/$@.epub $(FLAGS)

all: pgp ico adbd ars dbcs pys

pgp: pgp/*.md; $(COMMAND)

ico: ico/*.md; $(COMMAND)

adbd: adbd/*.md; $(COMMAND)

ars: ars/*.md; $(COMMAND)

dbcs: dbcs/*.md; $(COMMAND)

pys: pys/*.md; $(COMMAND)

clean:
	find . -name \*.epub -type f -delete

.PHONY: all clean
