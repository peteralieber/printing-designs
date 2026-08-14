# Copilot Instructions for Printing Designs

This repository is a collection of 3D-printable designs, primarily authored in OpenSCAD. Treat every change as a design task with a strong emphasis on printability, parameterization, and openness.

## Core design principles

- Prefer OpenSCAD as the primary source format for new models.
- Keep dimensions and tolerances explicit, typically in millimeters.
- Use descriptive variable names and parametric modules instead of hard-coded values.
- Favor designs that are easy to remix, repair, and print reliably.
- Add brief comments describing purpose, dimensions, materials, and expected usage.
- Avoid over-complexity when a simpler, more robust geometry is available.

## Repository workflow

- Inspect existing models in `designs/` before creating new ones.
- Save render previews and outputs in `renders/` when relevant.
- Keep source files open, readable, and editable by future contributors.
- If the model is meant for 3D printing, consider layer height, wall thickness, clearances, overhangs, and assembly fit.
- For symbolically generated geometry, consolidate variables at the top of the file and keep them easy to adjust.

## Validation

When a model is created or modified, validate it with the command-line OpenSCAD render flow whenever possible. A good iteration loop is:

1. Write or update the `.scad` source.
2. Render the model with `openscad`.
3. Inspect the result visually.
4. Adjust dimensions or geometry as needed.
5. Repeat until the design meets the requested constraints.

## References and research

Use the official OpenSCAD documentation and established 3D-printing best practices when uncertain about syntax, geometry operations, or printability constraints. For image-based reviews, analyze the rendered output and suggest practical corrections grounded in printability and assembly constraints.
