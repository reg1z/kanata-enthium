## ADDED Requirements

### Requirement: Symbol layer
A symbol layer SHALL be available, activated by holding the right alt key (enthium10) or a dedicated key. It SHALL map symbols to the left hand and editing keys to the right hand.

#### Scenario: Left hand symbol mappings
- **WHEN** the symbol layer is active
- **THEN** the left hand SHALL produce symbols:
  - `1`→`` ` ``, `2`→`(`, `3`→`)`, `4`→`;`, `5`→`,`
  - `q`→`[`, `w`→`{`, `e`→`}`, `r`→`]`, `t`→`?`
  - `a`→`^`, `s`→`=`, `d`→`_`, `f`→`$`, `g`→`*`
  - `z`→`<`, `x`→`|`, `c`→`-`, `v`→`>`, `b`→`!`
  - `tab`→`@`, `capslock`→`` ` ``, `leftshift`→`~`, `leftctrl`→`+`, `leftmeta`→`&`, `leftalt`→`%`, `space`→`\`

#### Scenario: Right hand editing mappings
- **WHEN** the symbol layer is active
- **THEN** the right hand SHALL produce editing keys:
  - `j`→Backspace, `k`→Tab, `l`→Space, `;`→Enter
  - `m`→Delete

### Requirement: Number layer
A number layer SHALL be available, activated by holding the left alt key (enthium10) or a dedicated key. It SHALL map numbers to the right hand and editing keys to the left hand.

#### Scenario: Right hand number mappings
- **WHEN** the number layer is active
- **THEN** the right hand SHALL produce:
  - `m`→`1`, `,`→`2`, `.`→`3`
  - `j`→`4`, `k`→`5`, `l`→`6`
  - `u`→`7`, `i`→`8`, `o`→`9`
  - `space`→`0`
  - `rightalt`→`%`

#### Scenario: Left hand editing mappings
- **WHEN** the number layer is active
- **THEN** the left hand SHALL produce editing keys:
  - `a`→Enter, `s`→Space, `d`→Tab, `f`→Backspace

### Requirement: Workspaces layer
A workspaces layer SHALL be available, activated by holding the space bar. It SHALL provide workspace switching, navigation keys, and layout switching.

#### Scenario: Workspace switching
- **WHEN** the workspaces layer is active
- **THEN** workspace shortcuts SHALL be available:
  - `s`→Meta+1, `d`→Meta+2, `f`→Meta+3
  - `w`→Meta+4, `e`→Meta+5, `r`→Meta+6
  - `2`→Meta+7, `3`→Meta+8, `4`→Meta+9

#### Scenario: Arrow key navigation
- **WHEN** the workspaces layer is active
- **THEN** vim-style navigation SHALL be available:
  - `j`→Left, `k`→Down, `l`→Up, `;`→Right

#### Scenario: Page navigation
- **WHEN** the workspaces layer is active
- **THEN** page navigation SHALL be available:
  - `m`→Home, `,`→PageDown, `.`→PageUp, `/`→End

#### Scenario: Print screen passthrough
- **WHEN** the workspaces layer is active
- **AND** the user presses the print screen key
- **THEN** print screen (SysRq) SHALL be emitted

### Requirement: Spacebar streak protection
The spacebar SHALL use the same flowtap streak detection pattern as home row mods. During a typing streak, space SHALL emit immediately without engaging the workspace layer hold.

#### Scenario: Fast typing emits space immediately
- **WHEN** a typing streak is active
- **AND** the user presses space
- **THEN** space SHALL be emitted immediately with no tap-hold delay

#### Scenario: Deliberate hold activates workspaces
- **WHEN** no typing streak is active
- **AND** the user holds space past the hold threshold (150ms)
- **THEN** the workspaces layer SHALL activate

### Requirement: Print screen remapped to right meta
The physical print screen / SysRq key SHALL be remapped to right Meta (Super/Win) at the base layer level across all layouts.

#### Scenario: Print screen emits right meta
- **WHEN** the user presses the physical print screen key on any base layout
- **THEN** right Meta SHALL be emitted
