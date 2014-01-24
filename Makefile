TEX = pdflatex -file-line-error -interaction=nonstopmode
BIB = bibtex

DOC=presentation

all: $(DOC).pdf

$(DOC).pdf: $(DOC).tex
	pdflatex -file-line-error -interaction=nonstopmode $(DOC)
	pdflatex -file-line-error -interaction=nonstopmode $(DOC)
	open $(DOC).pdf
clean:
	rm $(DOC).aux $(DOC).log $(DOC).out $(DOC).pdf $(DOC).nav $(DOC).snm $(DOC).synctex.gz $(DOC).toc Examples/*.log Examples/*.aux Examples/*.pdf Examples/*.synctex.gz




