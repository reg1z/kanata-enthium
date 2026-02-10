## ADDED Requirements

### Requirement: Three base layouts
The system SHALL provide three switchable base layouts: `qwerty`, `miryoku-qwerty`, and `enthium10`.

#### Scenario: Default layout on startup
- **WHEN** kanata starts
- **THEN** the active base layout SHALL be `qwerty`

### Requirement: Qwerty layout
The `qwerty` layout SHALL map all keys to their standard QWERTY positions with no home row mods or tap-hold behavior.

#### Scenario: Plain typing in qwerty
- **WHEN** the `qwerty` layout is active
- **AND** the user presses any letter key
- **THEN** the standard QWERTY character SHALL be emitted immediately with no tap-hold delay

### Requirement: Miryoku-qwerty layout
The `miryoku-qwerty` layout SHALL map all keys to standard QWERTY positions but with flowtap home row mods on the home row keys (`a`, `s`, `d`, `f`, `j`, `k`, `l`, `;`).

#### Scenario: Home row keys have tap-hold behavior
- **WHEN** the `miryoku-qwerty` layout is active
- **AND** the user holds a home row key past the hold threshold
- **THEN** the corresponding modifier SHALL activate (a→Meta, s→Alt, d→Ctrl, f→Shift, j→Shift, k→Ctrl, l→Alt, ;→Meta)

### Requirement: Enthium10 layout
The `enthium10` layout SHALL remap all letter keys according to the enthium v10 character mapping and apply flowtap home row mods to the home row.

#### Scenario: Enthium character remapping
- **WHEN** the `enthium10` layout is active
- **AND** the user taps a letter key
- **THEN** the enthium-remapped character SHALL be emitted (e.g., physical `q`→`z`, physical `w`→`y`, physical `e`→`o`, physical `r`→`u`)

#### Scenario: Enthium home row mods
- **WHEN** the `enthium10` layout is active
- **AND** the user holds a home row key past the hold threshold
- **THEN** the corresponding modifier SHALL activate (physical `a`→Meta, `s`→Alt, `d`→Ctrl, `f`→Shift, `j`→Shift, `k`→Ctrl, `l`→Alt, `;`→Meta)

#### Scenario: Enthium left alt key
- **WHEN** the `enthium10` layout is active
- **AND** the user taps the physical left alt key
- **THEN** `esc` SHALL be emitted
- **AND** when held, the number layer SHALL activate

#### Scenario: Enthium right alt key
- **WHEN** the `enthium10` layout is active
- **AND** the user taps the physical right alt key
- **THEN** `r` SHALL be emitted
- **AND** when held, the symbol layer SHALL activate

### Requirement: Layout switching via space combos
The user SHALL be able to switch between base layouts by holding space (activating the workspaces layer) and pressing an arrow key.

#### Scenario: Switch to qwerty
- **WHEN** the user holds space and presses left arrow
- **THEN** the base layout SHALL switch to `qwerty`

#### Scenario: Switch to miryoku-qwerty
- **WHEN** the user holds space and presses right arrow
- **THEN** the base layout SHALL switch to `miryoku-qwerty`

#### Scenario: Switch to enthium10
- **WHEN** the user holds space and presses up arrow or down arrow
- **THEN** the base layout SHALL switch to `enthium10`

#### Scenario: Layout persists after switch
- **WHEN** the user switches layouts
- **AND** releases the space key
- **THEN** the new layout SHALL remain active until explicitly switched again
