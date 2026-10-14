.PHONY: all build clean validate check-deps

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

validate:
	find src -name '*.tex' -print0 | xargs -0 chktex -l .chktexrc

clean:
	rm -f dist/* build/*
	find . -iname "*~" -exec rm '{}' ';'
