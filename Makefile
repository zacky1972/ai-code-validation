.phony: all

all: ref.pdf

ref.pdf: ref.tex ref.bib

%.pdf: %.tex
	latexmk -pdfdvi \
		-e '$$latex = q/platex %O %S/;' \
		-e '$$bibtex = q/pbibtex %O %B/;' \
		-e '$$dvipdf = q/dvipdfmx %O -o %D %S/;' \
		$<

clean:
	latexmk -C *.tex 
