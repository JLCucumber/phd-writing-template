OUTPUT = output

pdf:
	mkdir -p $(OUTPUT)
	pandoc main.md \
		--citeproc \
		--bibliography=refs.bib \
		--csl=ieee.csl \
		--standalone \
		--css=style.css \
		--metadata link-citations=true \
		-o $(OUTPUT)/proposal.html
	weasyprint --base-url . $(OUTPUT)/proposal.html $(OUTPUT)/proposal.pdf


docx:
	mkdir -p $(OUTPUT)
	pandoc main.md \
		--citeproc \
		--bibliography=refs.bib \
		--csl=ieee.csl \
		-o $(OUTPUT)/proposal.docx

html:
	mkdir -p $(OUTPUT)
	pandoc main.md \
		--citeproc \
		--bibliography=refs.bib \
		--csl=ieee.csl \
		--embed-resources \
		--standalone \
		--css=style.css \
		--metadata link-citations=true \
		-o $(OUTPUT)/proposal.html

clean:
	rm -rf $(OUTPUT)

.PHONY: pdf docx html clean
