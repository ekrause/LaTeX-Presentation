UNAME:=$(shell uname -s)
ifeq ($(UNAME), Darwin)
	OPENCMD=open presentation.pdf
else
ifeq ($(UNAME), Linux)
	OPENCMD=xdg-open presentation.pdf
else
	OPENCMD=start presentation.pdf
endif
endif

EXFILES = $(wildcard */*.tex)

TEX = pdflatex -file-line-error -interaction=nonstopmode
BIB = bibtex

DOC=presentation
EXAMPLE=10-bibtex

all: $(DOC) bib

$(DOC): $(DOC).tex $(EXFILES)
	$(TEX) $(DOC)
	$(TEX) $(DOC)

notes: 	$(DOC).tex $(EXFILES)
	$(TEX) "\def\speakernotes{1} \input{$(DOC)}"
	$(TEX) "\def\speakernotes{1} \input{$(DOC)}"




flyer:
	$(TEX) flyer.tex

open: $(DOC).pdf
	$(OPENCMD)

bib:
	-cd Examples && $(TEX) $(EXAMPLE) 
	-cd Examples && $(BIB) $(EXAMPLE) 
	-cd Examples && $(TEX) $(EXAMPLE) 
	-cd Examples && $(TEX) $(EXAMPLE) 
	-cd Examples && $(TEX) $(EXAMPLE) 

clean:
	-rm -f *.aux *.log *.out *.pdf *.nav *.snm *.synctex.gz *.toc
	-rm -f */*.log */*.aux */*.pdf */*.synctex.gz */*.bbl */*.blg */*.dvi */*.out
