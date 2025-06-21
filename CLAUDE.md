# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is Dr. Jerid Francom's academic website built with Quarto. It serves as a personal homepage, blog, and CV for a linguistics professor specializing in corpus linguistics, computational linguistics, and Hispanic linguistics.

## Architecture

**Website Type**: Quarto website project with academic focus
**Core Structure**:

- `index.qmd` - Homepage with tabbed layout (Education, Experience, Teaching, Research, Contact)
- `cv.qmd` - Academic CV with multiple bibliography sources and PDF generation
- `posts/` - Blog posts directory with individual post folders
- `_extensions/` - Quarto extensions for CV formatting and FontAwesome icons
- Bibliography files: `main.bib`, `books.bib`, `chapters.bib`, `talks.bib`

**Key Features**:

- Multi-format CV generation (HTML + PDF via LaTeX)
- Blog posts with academic citations
- Custom CSS styling
- FontAwesome icon integration
- Google Analytics tracking
- Hypothesis commenting system

## Development Environment

**Primary Setup**: Nix flake-based development environment

- R with Quarto for content creation and rendering
- TeX Live for PDF generation
- Radian wrapper for enhanced R console

**Environment Activation**:

```bash
direnv allow
```

## Common Commands

**Development Server**:

```bash
quarto preview
# Runs on port 4200 as configured in _quarto.yml
```

**Build Website**:

```bash
quarto render
```

**Render Specific Document**:

```bash
quarto render index.qmd
quarto render cv.qmd
```

**CV PDF Generation**:

```bash
quarto render cv.qmd --to quarto-cv-pdf
```

## Content Structure

**Homepage (`index.qmd`)**:

- Uses Solana template with personal photo
- Tabbed content sections (Education, Experience, Teaching, Research, Contact)
- Social media and academic profile links

**CV (`cv.qmd`)**:

- Multiple bibliography sources using multibib extension
- Custom LaTeX formatting via quarto-cv extension
- Date floats for chronological information
- Dual output formats (HTML + PDF)

**Blog Posts (`posts/`)**:

- Individual folders per post with `index.qmd`
- Shared metadata in `_metadata.yml`
- Academic citations enabled
- Code execution with caching
- Fediverse creator attribution

**Bibliography Management**:

- `main.bib` - Primary academic publications
- `books.bib` - Book publications
- `chapters.bib` - Book chapters
- `talks.bib` - Conference presentations
- Used with `nocite: '@*'` to include all references

## Extensions and Dependencies

**Quarto Extensions**:

- `mps9506/quarto-cv` - Academic CV formatting
- `pandoc-ext/multibib` - Multiple bibliography support
- `quarto-ext/fontawesome` - Icon support

**R Packages** (from flake.nix):

- tidyverse, knitr, rmarkdown - Core R workflow
- cranlogs, scholar - Academic metrics
- devtools, pak, renv - Development tools

**TeX Packages**:

- Custom scheme with academic fonts (EB Garamond)
- FontAwesome support for icons
- ORCID integration

## Styling and Customization

**Themes**: 

- HTML: Bootstrap "journal" theme with custom CSS (`styles.css`, `cv.css`)
- Font size: 1.1em for improved readability

**Academic Features**:

- Citation support throughout
- Code syntax highlighting and copy buttons
- Table of contents for longer documents
- Creative Commons licensing footer

## Content Guidelines

**Posts**: Academic blog posts with R code examples, package announcements, and methodological discussions
**CV**: Comprehensive academic record with automatic bibliography inclusion
**Homepage**: Professional presentation with research focus and contact information

## File Organization

- Root-level `.qmd` files for main pages
- `posts/` directory with subdirectories per post
- `_extensions/` for Quarto extensions
- Bibliography files in root directory
- Assets (images, CSS) in root or alongside content
