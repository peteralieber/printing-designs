---
agent: 'agent'
description: 'Modify an existing OpenSCAD design to meet new requirements.'
---

Edit the existing OpenSCAD design to satisfy the requested change.

Steps:
- Identify the target file under `designs/`.
- Preserve the original model intent unless the user requests a change in scope.
- Make the update as surgical as possible.
- Keep parameterization readable and consistent with the repo's style.
- Re-render the result after the change using `scripts/render-scad.ps1` (Windows) or `scripts/render-scad.sh` (macOS/Linux), and report the visual outcome.

Requested change:
{your specification}

Deliver:
1. What changed and why
2. Updated source
3. Render validation step performed, including the exact script command used from `scripts/`
4. Remaining considerations for more refinement
