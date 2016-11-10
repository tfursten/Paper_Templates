LATEX=lualatex
LATEXMK=latexmk
LATEXOPT=-file-line-error


MAIN=papername
SOURCES=$(MAIN).tex Makefile bibname.bib
FIGURES := $(shell ls Figures/*.pdf)

all:	$(MAIN).pdf

.refresh:
		touch .refresh

$(MAIN).pdf: $(MAIN).tex .refresh $(SOURCES) $(FIGURES)
		$(LATEXMK) -pdf $(MAIN).tex

force:
		touch .refresh
		$(MAKE) $(MAIN).pdf

.PHONY: clean force all

clean:
		$(LATEXMK) -C $(MAIN).tex
		rm -f $(MAIN).pdfsync
		rm -rf *~ *.tmp
