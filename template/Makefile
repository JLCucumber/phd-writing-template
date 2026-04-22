OUTPUT = output
ASSETS = assets

pdf:
	mkdir -p $(OUTPUT)
	pandoc main.md \
		--citeproc \
		--bibliography=$(ASSETS)/refs.bib \
		--csl=$(ASSETS)/ieee.csl \
		--standalone \
		--css=$(ASSETS)/style.css \
		--metadata link-citations=true \
		-o $(OUTPUT)/proposal.html
	weasyprint --base-url . $(OUTPUT)/proposal.html $(OUTPUT)/proposal.pdf


docx:
	mkdir -p $(OUTPUT)
	pandoc main.md \
		--citeproc \
		--bibliography=$(ASSETS)/refs.bib \
		--csl=$(ASSETS)/ieee.csl \
		-o $(OUTPUT)/proposal.docx

html:
	mkdir -p $(OUTPUT)
	pandoc main.md \
		--citeproc \
		--bibliography=$(ASSETS)/refs.bib \
		--csl=$(ASSETS)/ieee.csl \
		--embed-resources \
		--standalone \
		--css=$(ASSETS)/style.css \
		--metadata link-citations=true \
		-o $(OUTPUT)/proposal.html

clean:
	rm -rf $(OUTPUT)

.PHONY: pdf docx html clean
