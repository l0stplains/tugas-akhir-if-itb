.PHONY: all build build-bab2 clean validate check-deps

all: clean build

check-deps:
	@for tool in latexmk pdflatex bibtex; do \
		command -v "$$tool" >/dev/null 2>&1 || { \
			printf 'Missing required tool: %s. Install TeX Live; see README.md.\n' "$$tool" >&2; \
			exit 1; \
		}; \
	done

build: check-deps
	mkdir -p dist
	mkdir -p build
	latexmk -pdf -bibtex -outdir=../build -cd src/thesis.tex
	mv build/thesis.pdf dist

build-bab2: check-deps
	mkdir -p dist build/bab2-draft
	latexmk -pdf -bibtex -outdir=../build/bab2-draft -cd src/bab2-draft.tex
	cp build/bab2-draft/bab2-draft.pdf dist/bab2-draft.pdf

validate:
	find src -name '*.tex' -print0 | xargs -0 chktex -l .chktexrc

clean:
	rm -f dist/*
	rm -rf build
	find . -iname "*~" -exec rm '{}' ';'
