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

EXFILES=$(wildcard */*.tex)
GENFILES=*.{aux,bbl,blg,dvi,log,nav,out,snm,synctex.gz,toc}

TEX = pdflatex -file-line-error -interaction=nonstopmode
BIB = bibtex

DOC=presentation
EXAMPLE=10-bibtex

all: $(DOC) bibdemo

$(DOC): $(DOC).tex $(EXFILES)
	$(TEX) $(DOC)
	$(TEX) $(DOC)

notes: 	$(DOC).tex $(EXFILES)
	$(TEX) -jobname notes "\def\speakernotes{1} \input{$(DOC)}"
	$(TEX) -jobname notes "\def\speakernotes{1} \input{$(DOC)}"

flyer: flyer.tex
	$(TEX) flyer.tex

bibdemo:
	-cd Examples && $(TEX) $(EXAMPLE) 
	-cd Examples && $(BIB) $(EXAMPLE) 
	-cd Examples && $(TEX) $(EXAMPLE) 
	-cd Examples && $(TEX) $(EXAMPLE) 
	-cd Examples && $(TEX) $(EXAMPLE) 

open: $(DOC).pdf
	$(OPENCMD)

clean:
	-rm -f $(GENFILES) flyer.pdf
	-mv Examples/10-bibtex.pdf .
	-rm -f */$(GENFILES) */*.pdf
	-mv 10-bibtex.pdf Examples/
