# Mountain Hideout (Minecraft)

A two-story mountain hideout inspired by the reference image: a dark-stone
lodge built against a mountainside, with a chiseled-bookshelf feature wall,
a recessed nether portal on the upper facade, a fenced wooden balcony, an
exterior staircase, and a tall red-brick watchtower.

## Files

- `README.md` — this document.
- `structure.yaml` — the canonical build data: every block region as
  coordinates + block type, relative to the player position.
- `build.ahk` — AutoHotkey v2 script that drives the Minecraft player to
  place all blocks (via chat `/fill` and `/setblock` commands).

## Coordinate system

The player stands at the **front-left-bottom corner** of the build, at floor
level, looking at the build.

- **+X** — to the right along the front wall (16 blocks wide)
- **+Y** — up
- **+Z** — away from the player, into the build (14 blocks deep)
- Negative Z (the balcony and front stairs) extends toward the player.

Total footprint: **18 wide x 19 deep x 15 tall** (including tower, balcony,
and foundation).

## Structure

| Part | Blocks | Notes |
|------|--------|-------|
| Foundation | Cobblestone | 1 block below floor level |
| Ground floor | Spruce planks | 16 x 14 |
| Walls (both floors) | Deepslate bricks, spruce-log corner pillars | 4 blocks tall per floor |
| Front feature wall | Chiseled bookshelves | Flanked by windows, double-door entrance |
| Second floor | Spruce planks | Full footprint |
| Balcony | Spruce planks + spruce fence railing | 3 blocks deep, front of build |
| Upper facade | Deepslate bricks with recessed nether portal | Obsidian frame, light with flint & steel |
| Roof | Spruce slabs (top half) | 1-block overhang |
| Watchtower | Red nether bricks | 5 x 5 x 13, crenellated top, connected at 2nd floor |
| Stairs | Spruce stairs | Exterior, front-left, up to balcony |
| Lighting | Lanterns | Balcony corners and interior |

## Building in game

1. Install [AutoHotkey v2](https://www.autohotkey.com/).
2. Open Minecraft Java Edition in a world with **cheats enabled**
   (creative mode recommended).
3. Stand where you want the front-left-bottom corner of the building to be.
4. Run `build.ahk`, focus the Minecraft window.
5. Press **F8** to start, **F9** to pause/resume, **F10** to abort.
6. After the script finishes, light the nether portal manually with flint
   and steel.

The script types each operation into the chat as a `/fill` or `/setblock`
command using relative (`~`) coordinates, so the whole build is placed
relative to your position.
