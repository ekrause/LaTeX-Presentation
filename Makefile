UNAME:=$(shell uname -s)
ifeq ($(UNAME), Darwin)
	OPENCMD=open presentation.pdf
else
	OPENCMD=
endif

ifeq ($(UNAME), Linux)
	OPENCMD=xdg-open presentation.pdf
endif

TEX = pdflatex -file-line-error -interaction=nonstopmode
BIB = bibtex

DOC=presentation

all: $(DOC).pdf

$(DOC).pdf: $(DOC).tex
	pdflatex -file-line-error -interaction=nonstopmode $(DOC)
	pdflatex -file-line-error -interaction=nonstopmode $(DOC)
	$(OPENCMD)
clean:
	rm $(DOC).aux $(DOC).log $(DOC).out $(DOC).pdf $(DOC).nav $(DOC).snm $(DOC).synctex.gz $(DOC).toc Examples/*.log Examples/*.aux Examples/*.pdf Examples/*.synctex.gz




