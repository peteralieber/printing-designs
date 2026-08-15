---
agent: 'agent'
description: 'Create a new OpenSCAD design from a design brief.'
---

Create a new OpenSCAD design based on the following request.

Requirements:
- Save the source under `designs/`.
- Use a parametric, readable, print-oriented style.
- Keep units in millimeters and define key dimensions at the top of the file.
- Add a brief comment block describing intended use and print notes.
- Prefer simple geometry that is easy to manufacture and remix.
- Create the initial source file by running `scripts/new-design.ps1` (Windows) or `scripts/new-design.sh` (macOS/Linux).
- If useful, add a small render preview to `renders/` by running `scripts/render-scad.ps1` (Windows) or `scripts/render-scad.sh` (macOS/Linux).

Before writing, review any nearby patterns in `designs/` and match the repository style.

Design brief:
{your requirement}

Deliver:
1. A short design concept summary
2. The OpenSCAD source file
3. The exact script command(s) used from `scripts/`
4. Any key tuning notes or follow-up iterations
