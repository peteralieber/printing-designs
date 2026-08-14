# Printing Designs

This repository is a curated library of 3D-printable designs, with an emphasis on open and editable OpenSCAD sources. The purpose is to give a single place to create, iterate on, and share parametric models for practical, maker-friendly use cases.

## Purpose

- Store design source files in an open, text-first format
- Prefer parametric, remixable, and printable models
- Use OpenSCAD as the primary authoring language for algorithmic geometry
- Keep rendered previews alongside source files for quick visual review
- Support AI-assisted design iteration for new models and revisions

## Repository layout

- `designs/` - source SCAD models and design collections
- `renders/` - generated preview images and exported outputs
- `scripts/` - helper commands for rendering and creating model templates
- `.github/` - Copilot instructions, reusable prompts, and setup for the AI design workflow
- `LICENSE` - repository licensing information

## Recommended workflow

1. Describe a need in plain language.
2. Use a prompt from `.github/prompts/` or craft a new one.
3. Create or edit a model under `designs/`.
4. Render it with OpenSCAD from the command line.
5. Review the result, then iterate until the model is ready.

## Notes

This is intentionally an open-source and design-first repository: source files should remain readable, well-documented, and easy to remix. Where possible, keep dimensions in millimeters, make tolerances explicit, and favor printability over decorative complexity.
