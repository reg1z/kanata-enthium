## 1. Config Foundation

- [ ] 1.1 Create `enthium.kbd` at project root with `defcfg` block (`process-unmapped-keys yes`, `concurrent-tap-hold yes`)
- [ ] 1.2 Define `defvar` block with per-finger timing variables (pinky/ring/mid/index hold-time and streak-time), streak-count, and tap-time
- [ ] 1.3 Define `defsrc` block listing the full keyboard (all keys needed for key-timing to register streaks)

## 2. Home Row Mods Engine

- [ ] 2.1 Create `deftemplate hrm` implementing the flowtap pattern: `key-timing` streak check → pure tap, else `tap-hold-release-timeout` with per-finger params
- [ ] 2.2 Create `deftemplate streaktap` for spacebar and alt keys: flowtap + tap-hold for layer activation (similar to hrm but hold action is a layer instead of a modifier)

## 3. Base Layouts

- [ ] 3.1 Define `deflayer qwerty` — standard QWERTY, no tap-hold, print screen → right meta
- [ ] 3.2 Define `deflayer miryoku-qwerty` — QWERTY characters with `hrm` template on home row (a/Meta, s/Alt, d/Ctrl, f/Shift, j/Shift, k/Ctrl, l/Alt, ;/Meta), print screen → right meta
- [ ] 3.3 Define `deflayer enthium10` — enthium v10 character remapping with `hrm` template on home row, left alt tap=esc/hold=number, right alt tap=r/hold=symbol, print screen → right meta

## 4. Overlay Layers

- [ ] 4.1 Define `deflayer symbol` — left hand symbols, right hand editing keys (backspace, tab, space, enter, delete), unmapped keys transparent
- [ ] 4.2 Define `deflayer number` — right hand numbers (1-9, 0 on space), left hand editing keys, right alt → %, unmapped keys transparent
- [ ] 4.3 Define `deflayer workspaces` — workspace shortcuts (Meta+1-9), vim navigation (j/k/l/;→arrows), page nav (m/,/./→home/pgdn/pgup/end), print screen passthrough (SysRq), layout switching (left→qwerty, right→miryoku-qwerty, up/down→enthium10)

## 5. Aliases and Wiring

- [ ] 5.1 Define `defalias` block wiring all `hrm` template invocations with correct characters, modifiers, and per-finger timing for both miryoku-qwerty and enthium10
- [ ] 5.2 Define `defalias` for spacebar flowtap (tap=space, hold=workspaces layer, with streak protection)
- [ ] 5.3 Define `defalias` for enthium10 alt keys (left alt: tap=esc/hold=number, right alt: tap=r/hold=symbol, both with streak protection)
- [ ] 5.4 Define `defalias` for layout switching actions (`layer-switch` to each base layout)

## 6. Validation

- [ ] 6.1 Verify config parses without errors (`kanata --cfg enthium.kbd --check`)
- [ ] 6.2 Manual testing: confirm enthium10 character mapping matches keyd layout
- [ ] 6.3 Manual testing: confirm home row mods activate on deliberate hold, not during fast typing
- [ ] 6.4 Manual testing: confirm symbol, number, and workspaces layers work correctly
- [ ] 6.5 Manual testing: confirm layout switching via space+arrow works
