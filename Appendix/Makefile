# sample makefile

# use pdflatex with reccomended flags:
#  -file-line-error gives traditional file:line:error style messages.
#  -interaction=nonstopmode = exit back to command line on error.
TEX = pdflatex -file-line-error -interaction=nonstopmode

BIB = bibtex

# update YourDocumentName to the filename (without extension) of your LaTeX doc
DOC=YourDocumentName

# update YourBibTexDocumentName to the filename (without extension) of your 
# latex document which uses bibtex for bibliography management
BIBDOC=YourBibTexDocumentName

# default target: compile a LaTeX document
$(DOC): $(DOC).tex $(EXFILES)
    $(TEX) $(DOC)
    $(TEX) $(DOC)

# bibtex target: compile a LaTeX document with a BibTeX bibliography
$(BIBDOC):
	$(TEX) $(BIBDOC) 
	$(BIB) $(BIBDOC) 
	$(TEX) $(BIBDOC) 
	$(TEX) $(BIBDOC) 
	$(TEX) $(BIBDOC) 

# remove all generated files 
clean:
    -rm -f *.{aux,bbl,blg,dvi,log,nav,out,snm,synctex.gz,toc}