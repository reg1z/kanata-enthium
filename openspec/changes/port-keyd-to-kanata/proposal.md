## Why

The current keyboard layout is defined in keyd, which lacks support for typing streak detection and same-hand roll protection. This causes frequent accidental home row mod activations during normal typing. Kanata provides native primitives (`key-timing`, `tap-hold-release-timeout`, per-finger timing) that solve this problem without requiring custom firmware-level hacks.

## What Changes

- Create a kanata configuration file that replaces the keyd configuration
- Port three base layouts: plain qwerty, qwerty with home row mods (miryoku), and enthium10 with home row mods (miryoku)
- Port three overlay layers: symbol, number, and workspaces
- Add flowtap-based typing streak detection with per-finger timing thresholds
- Add streak-protected spacebar for workspace layer activation
- Implement layout switching via space+arrow key combos
- Enthium10-specific: left alt taps esc / holds number layer; right alt taps r / holds symbol layer

## Capabilities

### New Capabilities
- `base-layouts`: Three switchable base layouts (qwerty, miryoku-qwerty, enthium10) with space+arrow switching
- `home-row-mods`: Flowtap-based home row modifiers with per-finger timing and typing streak protection
- `overlay-layers`: Symbol, number, and workspace overlay layers activated by key holds

### Modified Capabilities

## Impact

- New file: kanata configuration file (`.kbd` extension) at project root
- Replaces: `keyd_enthium_layout.conf` (keyd config becomes reference-only)
- Dependency: requires kanata to be installed on the system
- No other code or systems affected — this is a standalone keyboard remapper config
