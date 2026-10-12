# Tugas Akhir

LaTeX sources for my thesis, based on the
[IF ITB LaTeX template](https://github.com/petrabarus/if-itb-latex).
The template's sample content and personal information are retained as a
starting point.

## Start writing

- `src/thesis.tex`: main document, title, author, and chapter order.
- `src/chapters/`: chapters, abstracts, cover, approval, declaration, and appendices.
- `src/references.bib`: bibliography.
- `src/resources/`: figures and CSV tables.
- `src/config/`: document formatting.

When personalizing the thesis, also check the cover, approval, and declaration
files for sample names, dates, and supervisor details.

## Build

Install TeX Live (or MiKTeX on Windows), the template's required packages,
and `latexmk`. See [the original template documentation](TEMPLATE-README.md)
for installation details.

From this directory:

```sh
make build    # Compile to dist/thesis.pdf
make validate # Check LaTeX sources; requires chktex
make clean    # Remove generated files
```

Generated files in `build/` and `dist/` are ignored by Git.
The included GitHub Actions workflow builds the PDF on pushes to `main`.
Download the `thesis-pdf` artifact from the workflow run.
If removing sample resources, also update the resource checks in
`.github/workflows/build.yml`.

## Repository

This repository keeps the template's Git history. The `upstream` remote points
to the original template; `origin` is reserved for my own repository.

To create a private GitHub repository after authenticating with `gh`:

```sh
gh repo create tugasakhir --private --source=. --remote=origin --push
```

## Template credits

Template by Petra Novandi Barus, with contributions credited to Steven Lolong
and Peb Ruswono Aryan. Original usage instructions and credits are preserved in
[TEMPLATE-README.md](TEMPLATE-README.md); the original template changelog is
in [CHANGELOG.md](CHANGELOG.md).
