FLAGS=--toc --smart --epub-stylesheet=../epub.css
BASE=cd $@ && pandoc $(addprefix ../, $(wildcard $^)) -o

epub: 
	EXT=epub
	$(MAKE) todas

pdf:
	EXT=pdf
	$(MAKE) todas

todas: pgp ico adbd ars dbcs pys ssee

pgp: pgp/*.$(EXT); 
	$(BASE) $(EXT)/$@.$(EXT) $(FLAGS)

ico: ico/*.$(EXT); $(BASE) $(EXT)/$@.$(EXT) $(FLAGS)

adbd: adbd/*.$(EXT); $(BASE) $(EXT)/$@.$(EXT) $(FLAGS)

ars: ars/*.$(EXT); $(BASE) $(EXT)/$@.$(EXT) $(FLAGS)

dbcs: dbcs/*.$(EXT); $(BASE) $(EXT)/$@.$(EXT) $(FLAGS)

pys: pys/*.$(EXT); $(BASE) $(EXT)/$@.$(EXT) $(FLAGS)

ssee: ssee/*.$(EXT); $(BASE) $(EXT)/$@.$(EXT) $(FLAGS)

clean:
	find . -name \*.epub -type f -delete

.PHONY: epub clean pdf todas
