FLAGS=--toc

all: pgp ico adbd ars dbcs pys

pgp: pgp/pgp.md
	pandoc -i $^ -o $@/epub/$@.epub $(FLAGS)

ico: ico/ico.md
	pandoc -i $^ -o $@/epub/$@.epub $(FLAGS)

adbd: adbd/adbd.md
	pandoc -i $^ -o $@/epub/$@.epub $(FLAGS)

ars: ars/ars.md
	pandoc -i $^ -o $@/epub/$@.epub $(FLAGS)

dbcs: dbcs/dbcs.md
	pandoc -i $^ -o $@/epub/$@.epub $(FLAGS)

pys: pys/pys.md
	pandoc -i $^ -o $@/epub/$@.epub $(FLAGS)

clean:
	find . -name \*.epub -type f -delete

.PHONY: all clean
