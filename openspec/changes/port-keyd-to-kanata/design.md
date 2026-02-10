## Context

The current keyboard layout is defined in `keyd_enthium_layout.conf` using keyd's configuration format. It defines three base layouts (qwerty, miryoku_qwerty, miryoku_enthium10) and three overlay layers (symbol, number, workspaces). Home row mods use keyd's `timeout()` function, which has no typing streak awareness — leading to frequent accidental modifier activations during fast typing.

Kanata is a cross-platform keyboard remapper that provides native primitives for streak detection (`key-timing` + `switch`), multiple tap-hold variants, per-finger timing, and template-based configuration. It uses S-expression syntax and processes keys via `defsrc`/`deflayer` positional mapping.

## Goals / Non-Goals

**Goals:**
- Reproduce all keyd layout functionality in kanata
- Add typing streak detection (flowtap) to prevent accidental home row mod activation
- Use per-finger timing thresholds matching natural finger speed differences
- Add streak protection to the spacebar workspace-layer hold
- Maintain layout switching via space+arrow combos
- Produce a single, well-organized `.kbd` config file

**Non-Goals:**
- Bilateral combination enforcement (opposite-hand-only mods) — explicitly excluded
- Nomods auto-switch layer — unnecessary complexity for now
- Capslock-to-escape mapping — not desired
- Supporting keyd and kanata simultaneously (kanata replaces keyd)
- Mouse keys or other advanced kanata features not in the keyd config

## Decisions

### 1. Flowtap via `key-timing` + `switch` for streak detection

**Choice**: Use kanata's `key-timing` condition inside `switch` actions to detect typing streaks. If N recent keys were pressed within a threshold, bypass tap-hold and emit a pure tap.

**Alternatives considered**:
- `tap-hold-release-keys` with same-hand key lists (bilateral enforcement) — rejected because user does not want to enforce opposite-hand combos
- Nomods layer auto-switch pattern — rejected as unnecessary complexity; flowtap alone provides sufficient protection
- Plain `tap-hold-release` without streak detection — rejected because it doesn't prevent fast-typing misfires

**Rationale**: Flowtap is the simplest approach that solves the core problem. It's a single template that wraps each home row key.

### 2. Per-finger timing thresholds

**Choice**: Different hold and streak timing per finger position:

| Finger | Hold time | Streak time |
|--------|-----------|-------------|
| Pinky  | 185ms     | 250ms       |
| Ring   | 185ms     | 250ms       |
| Middle | 150ms     | 200ms       |
| Index  | 120ms     | 180ms       |

**Rationale**: Mirrors the graduated approach from sunaku's ZMK config and matches the existing keyd timeout values. Pinkies are slower and need more tolerance; index fingers are fast and can use tighter thresholds.

### 3. `tap-hold-release-timeout` as the tap-hold variant

**Choice**: Use `tap-hold-release-timeout` with the 5th parameter set to the tap action (safe fallback on timeout).

**Alternatives considered**:
- `tap-hold` (basic) — no early activation on key release, feels sluggish
- `tap-hold-press` — activates hold on any key press, too aggressive
- `tap-hold-release` — good but no timeout fallback
- `tap-hold-release-keys` — adds bilateral enforcement, not desired

**Rationale**: `tap-hold-release-timeout` gives the best behavior: hold activates when another key is pressed AND released (natural typing feel), and if the timeout expires without another key press, it safely falls back to tap.

### 4. `deftemplate` for DRY home row mod definitions

**Choice**: Use kanata's `deftemplate` + `t!` to define the flowtap+tap-hold combo once, parameterized by character, modifier, hold-time, and streak-time.

**Rationale**: Eliminates repetition across 8 home row keys (4 per hand) and makes timing adjustments trivial.

### 5. Spacebar with streak-protected layer hold

**Choice**: Apply the same flowtap pattern to spacebar: if in a typing streak, emit space immediately; otherwise, tap-hold between space and the workspaces layer.

**Rationale**: Prevents accidental workspace layer activation during fast typing while preserving the space+key combo for deliberate use.

### 6. Layout switching via `layer-switch`

**Choice**: Use kanata's `layer-switch` action within the workspaces layer to permanently swap the base layout. Space+left → qwerty, space+right → miryoku_qwerty, space+up/down → enthium10.

**Rationale**: Direct equivalent of keyd's `setlayout()`. `layer-switch` changes the default base layer until explicitly switched again.

### 7. Single config file

**Choice**: One `.kbd` file at the project root containing all layers, templates, and configuration.

**Rationale**: Kanata supports includes but the config is small enough to stay in one file. Easier to read, share, and iterate.

## Risks / Trade-offs

- **[Streak timing too aggressive]** → Per-finger values can be tuned independently. Start with conservative values and tighten based on usage.
- **[key-timing requires process-unmapped-keys]** → All typing keys must be in `defsrc` for streak detection to register them. This means the `defsrc` block must list the full keyboard, not just remapped keys.
- **[Layout switching state is invisible]** → No visual indicator of which layout is active. Mitigated by muscle memory and the fact that typing immediately reveals the active layout.
- **[Streak count (3) may not suit all typing patterns]** → The `streak-count` variable is easily adjustable. 3 is the community-recommended starting point.
