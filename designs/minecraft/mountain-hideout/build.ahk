#Requires AutoHotkey v2.0
#SingleInstance Force

; ============================================================================
; Mountain Hideout auto-builder for Minecraft Java Edition
; ============================================================================
;
; Generated from structure.yaml (same folder) - keep the two in sync.
;
; How it works:
;   Each operation from structure.yaml is typed into the Minecraft chat as a
;   /fill or /setblock command using relative (~) coordinates. Your current
;   position becomes the front-left-bottom corner of the building.
;
; Requirements:
;   - AutoHotkey v2 (https://www.autohotkey.com/)
;   - Minecraft Java Edition, world with cheats enabled (creative recommended)
;
; Usage:
;   1. Stand where the front-left-bottom corner of the build should be.
;   2. Focus the Minecraft window.
;   3. F8  = start building
;      F9  = pause / resume
;      F10 = abort
;   4. Afterwards, light the nether portal with flint & steel.
; ============================================================================

DelayMs := 450   ; delay between commands; raise it if chat rate-limits you

; --- Build operations (mirror of structure.yaml) ---
Ops := [
    ; Foundation and ground floor
    "fill ~0 ~-1 ~0 ~15 ~-1 ~13 minecraft:cobblestone",
    "fill ~0 ~0 ~0 ~15 ~0 ~13 minecraft:spruce_planks",
    ; Ground floor walls
    "fill ~0 ~1 ~0 ~15 ~4 ~0 minecraft:deepslate_bricks",
    "fill ~0 ~1 ~13 ~15 ~4 ~13 minecraft:deepslate_bricks",
    "fill ~0 ~1 ~1 ~0 ~4 ~12 minecraft:deepslate_bricks",
    "fill ~15 ~1 ~1 ~15 ~4 ~12 minecraft:deepslate_bricks",
    "fill ~0 ~1 ~0 ~0 ~4 ~0 minecraft:spruce_log",
    "fill ~15 ~1 ~0 ~15 ~4 ~0 minecraft:spruce_log",
    "fill ~0 ~1 ~13 ~0 ~4 ~13 minecraft:spruce_log",
    "fill ~15 ~1 ~13 ~15 ~4 ~13 minecraft:spruce_log",
    ; Ground floor openings and features
    "fill ~7 ~1 ~0 ~8 ~2 ~0 minecraft:air",
    "fill ~2 ~2 ~0 ~3 ~3 ~0 minecraft:glass",
    "fill ~10 ~2 ~0 ~13 ~3 ~0 minecraft:chiseled_bookshelf",
    ; Second floor
    "fill ~0 ~5 ~0 ~15 ~5 ~13 minecraft:spruce_planks",
    ; Upper walls
    "fill ~0 ~6 ~0 ~15 ~9 ~0 minecraft:deepslate_bricks",
    "fill ~0 ~6 ~13 ~15 ~9 ~13 minecraft:deepslate_bricks",
    "fill ~0 ~6 ~1 ~0 ~9 ~12 minecraft:deepslate_bricks",
    "fill ~15 ~6 ~1 ~15 ~9 ~12 minecraft:deepslate_bricks",
    "fill ~0 ~6 ~0 ~0 ~9 ~0 minecraft:spruce_log",
    "fill ~15 ~6 ~0 ~15 ~9 ~0 minecraft:spruce_log",
    "fill ~0 ~6 ~13 ~0 ~9 ~13 minecraft:spruce_log",
    "fill ~15 ~6 ~13 ~15 ~9 ~13 minecraft:spruce_log",
    ; Upper facade: portal and windows
    "fill ~6 ~6 ~0 ~9 ~9 ~0 minecraft:obsidian",
    "fill ~7 ~7 ~0 ~8 ~8 ~0 minecraft:air",
    "fill ~0 ~7 ~5 ~0 ~8 ~7 minecraft:glass",
    "fill ~15 ~7 ~5 ~15 ~8 ~7 minecraft:glass",
    ; Balcony
    "fill ~0 ~5 ~-3 ~15 ~5 ~-1 minecraft:spruce_planks",
    "fill ~0 ~6 ~-3 ~15 ~6 ~-3 minecraft:spruce_fence",
    "fill ~0 ~6 ~-2 ~0 ~6 ~-1 minecraft:spruce_fence",
    "fill ~15 ~6 ~-2 ~15 ~6 ~-1 minecraft:spruce_fence",
    ; Roof
    "fill ~-1 ~10 ~-1 ~16 ~10 ~14 minecraft:spruce_slab[type=top]",
    ; Watchtower
    "fill ~16 ~0 ~9 ~20 ~12 ~13 minecraft:red_nether_bricks",
    "fill ~16 ~13 ~9 ~20 ~13 ~13 minecraft:red_nether_bricks",
    "fill ~17 ~13 ~10 ~19 ~13 ~12 minecraft:air",
    "setblock ~16 ~14 ~9 minecraft:red_nether_brick_wall",
    "setblock ~20 ~14 ~9 minecraft:red_nether_brick_wall",
    "setblock ~16 ~14 ~13 minecraft:red_nether_brick_wall",
    "setblock ~20 ~14 ~13 minecraft:red_nether_brick_wall",
    "setblock ~18 ~14 ~11 minecraft:red_nether_brick_wall",
    "fill ~15 ~6 ~11 ~16 ~7 ~11 minecraft:air",
    ; Exterior stairs
    "setblock ~-1 ~1 ~-6 minecraft:spruce_stairs[facing=east]",
    "setblock ~-1 ~2 ~-5 minecraft:spruce_stairs[facing=east]",
    "setblock ~-1 ~3 ~-4 minecraft:spruce_stairs[facing=east]",
    "setblock ~-1 ~4 ~-3 minecraft:spruce_stairs[facing=east]",
    "setblock ~-1 ~5 ~-2 minecraft:spruce_stairs[facing=east]",
    ; Lanterns
    "setblock ~0 ~7 ~-3 minecraft:lantern",
    "setblock ~15 ~7 ~-3 minecraft:lantern",
    "setblock ~4 ~4 ~6 minecraft:lantern[hanging=true]",
    "setblock ~11 ~4 ~6 minecraft:lantern[hanging=true]",
    "setblock ~7 ~9 ~6 minecraft:lantern[hanging=true]"
]

gPaused := false
gAbort  := false

F8:: StartBuild()
F9:: TogglePause()
F10:: AbortBuild()

StartBuild() {
    global gPaused, gAbort, Ops, DelayMs
    static running := false
    if running
        return
    running := true
    gAbort := false
    total := Ops.Length
    for i, cmd in Ops {
        if gAbort
            break
        while gPaused and !gAbort
            Sleep 100
        if gAbort
            break
        SendChatCommand(cmd)
        ToolTip "Mountain Hideout: " i "/" total
        Sleep DelayMs
    }
    ToolTip
    running := false
}

TogglePause() {
    global gPaused
    gPaused := !gPaused
    ToolTip gPaused ? "Mountain Hideout: PAUSED (F9 to resume)" : ""
    if !gPaused
        ToolTip
}

AbortBuild() {
    global gAbort, gPaused
    gAbort := true
    gPaused := false
    ToolTip
}

SendChatCommand(cmd) {
    ; Open chat, type the command, execute.
    Send "{t}"
    Sleep 150
    SendText "/" cmd
    Sleep 100
    Send "{Enter}"
}
