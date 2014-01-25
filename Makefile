UNAME:=$(shell uname -s)
ifeq ($(UNAME), Darwin)
	OPENCMD=open presentation.pdf
else
ifeq ($(UNAME), Linux)
	OPENCMD=xdg-open presentation.pdf
else
	OPENCMD=
endif
endif

EXFILES = $(wildcard Examples/*.tex)

TEX = pdflatex -file-line-error -interaction=nonstopmode
BIB = bibtex

DOC=presentation

all: $(DOC).pdf

$(DOC).pdf: $(DOC).tex $(EXFILES)
	$(TEX) $(DOC)
	$(TEX) $(DOC)

open: $(DOC).pdf
	$(OPENCMD)

clean:
	rm -f $(DOC).aux $(DOC).log $(DOC).out $(DOC).pdf $(DOC).nav $(DOC).snm $(DOC).synctex.gz $(DOC).toc Examples/*.log Examples/*.aux Examples/*.pdf Examples/*.synctex.gz 
