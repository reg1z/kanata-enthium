## ADDED Requirements

### Requirement: Flowtap streak detection
Home row mod keys SHALL use the flowtap pattern: if a typing streak is detected (3 or more keys pressed within the per-finger streak threshold), the key SHALL emit its tap character immediately without engaging tap-hold logic.

#### Scenario: Fast typing bypasses mods
- **WHEN** the user is typing rapidly (3+ keys within the streak threshold)
- **AND** the user presses a home row mod key
- **THEN** the tap character SHALL be emitted immediately
- **AND** no modifier SHALL activate

#### Scenario: Deliberate hold activates mod
- **WHEN** no typing streak is active
- **AND** the user holds a home row mod key past the hold threshold
- **THEN** the corresponding modifier SHALL activate

#### Scenario: Timeout falls back to tap
- **WHEN** no typing streak is active
- **AND** the user holds a home row mod key
- **AND** no other key is pressed before the timeout expires
- **THEN** the tap character SHALL be emitted (safe fallback)

### Requirement: Per-finger timing thresholds
Each home row mod key SHALL use timing thresholds matched to its finger position. Slower fingers (pinky, ring) SHALL have longer thresholds than faster fingers (index).

#### Scenario: Pinky finger timing
- **WHEN** a pinky home row key is used (physical `a` or `;`)
- **THEN** hold-time SHALL be 185ms and streak-time SHALL be 250ms

#### Scenario: Ring finger timing
- **WHEN** a ring home row key is used (physical `s` or `l`)
- **THEN** hold-time SHALL be 185ms and streak-time SHALL be 250ms

#### Scenario: Middle finger timing
- **WHEN** a middle home row key is used (physical `d` or `k`)
- **THEN** hold-time SHALL be 150ms and streak-time SHALL be 200ms

#### Scenario: Index finger timing
- **WHEN** an index home row key is used (physical `f` or `j`)
- **THEN** hold-time SHALL be 120ms and streak-time SHALL be 180ms

### Requirement: Tap-hold uses release-timeout variant
Home row mod keys SHALL use the `tap-hold-release-timeout` tap-hold variant, which activates the hold action when another key is pressed AND released, and falls back to tap on timeout.

#### Scenario: Hold activates on other key release
- **WHEN** the user holds a home row mod key
- **AND** presses and releases another key
- **THEN** the modifier SHALL activate before the other key's character is emitted

### Requirement: Modifier assignments
Home row mod keys SHALL be assigned modifiers in the standard Miryoku pattern, mirrored across hands.

#### Scenario: Left hand modifier assignments
- **WHEN** a left-hand home row key is held (outside a streak)
- **THEN** physical `a`→Meta, `s`→Alt, `d`→Ctrl, `f`→Shift

#### Scenario: Right hand modifier assignments
- **WHEN** a right-hand home row key is held (outside a streak)
- **THEN** physical `j`→Shift, `k`→Ctrl, `l`→Alt, `;`→Meta

### Requirement: DRY template for home row mod definitions
Home row mod behavior SHALL be defined using a kanata `deftemplate` parameterized by character, modifier, hold-time, and streak-time to avoid repetition.

#### Scenario: Template used for all HRM keys
- **WHEN** the config defines a home row mod key
- **THEN** it SHALL use the `hrm` template invoked via `t!`
