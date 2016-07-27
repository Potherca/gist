## TODO

- [ ] Create Jison definition that parses a single line
- [ ] Expand the Jison definition to parse all given lines
- [ ] Add more syntax support:
  - [ ] **Composite state** - A composite state can be define using the `state` keywords and brackets.
  - [ ] **Long name** - The `state` keyword can be used to add long description for states.
  - [ ] **Concurrent state** - Concurrent state can be defined into a composite state using either `--` or `||` symbol as separator.
  - [ ] **Arrow direction** - It is possible to force arrow's direction using the following syntax: `-down-> (default arrow)`, `-right->` or `->`, `-left->`, `-up->`. The arrow can be shortened by using only the first character or the two first characters of the direction (for example, `-d-` or `-do-` instead of `-down-`).
  - [ ] **Note** - Notes can be defined using `note left of`, `note right of`, `note top of`, `note bottom of` keywords. Notes can be defined on several lines.
  - [ ] **Skinparam** - The `skinparam` command can be used to change colors and fonts for the drawing.


