# CLAUDE.md

Academic website for Dr. Jerid Francom, built with Quarto. Homepage, blog, and CV for a linguistics professor (corpus linguistics, computational linguistics, Hispanic linguistics).

## Commands

```bash
# Environment setup (Nix flake — .envrc is gitignored)
echo "use flake ." > .envrc && direnv allow

# Development server (port 4200, configured in _quarto.yml)
quarto preview

# Build full site
quarto render

# CV PDF generation (uses lualatex)
quarto render cv.qmd --to quarto-cv-pdf
```

## Architecture

```
index.qmd                  # Homepage — Solana template, tabbed layout
cv.qmd                     # Academic CV — HTML + PDF via quarto-cv
cv-grant.qmd               # Grants-focused CV variant
posts.qmd                  # Blog listing page
posts/                     # Blog posts — one folder per post with index.qmd
  _metadata.yml            # Shared post metadata (citations, caching, fediverse)
_quarto.yml                # Site config (theme, navbar, analytics, hypothesis)
_extensions/               # Quarto extensions
assets/
  bibliography/            # main.bib, books.bib, chapters.bib, talks.bib
  css/                     # styles.css, cv.css
  images/                  # Site images
apa-cv.csl                 # Custom APA citation style (descending date order)
flake.nix                  # Nix dev environment (R packages, TeX Live, tools)
```

## Extensions

- `mps9506/quarto-cv` — Academic CV formatting (HTML + PDF)
- `pandoc-ext/multibib` — Multiple bibliography support; renders into divs with `id="refs-<name>"` pattern (e.g., `refs-main`, `refs-books`)
- `quarto-ext/fontawesome` — Icon shortcodes: `{{< fa [group] icon [options] >}}`

## Bibliography

Bibliography files live in `assets/bibliography/`. The CV uses `nocite: '@*'` to include all entries. Citation style is `apa-cv.csl` (APA format, sorted by descending date). The multibib filter produces separate reference divs per `.bib` file — place a div with the matching `id="refs-<name>"` where each section should render.

## CV specifics

- `cv.qmd` — Full academic CV with sections for publications, books, chapters, talks
- `cv-grant.qmd` — Grants-focused variant
- PDF output uses `lualatex` engine via the `quarto-cv` extension
- Date floats for chronological positioning in LaTeX output
