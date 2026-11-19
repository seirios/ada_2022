# DRAKON Ada

DRAKON Ada is a visual programming language that combines the user-friendliness and understandability of DRAKON diagrams with the power and correcteness of Ada.

## User manual

### Files

DRAKON Ada works with .drn files, which are sqlite3 databases created by DRAKON Editor, a Tcl/Tk 8.6 software.

From these .drn files, .ads/.adb files are generated using a custom Ada code generator on top of DRAKON Editor.

Each .drn file corresponds to a compilation unit, i.e., a package or task or standalone subprogram.

Each .drn file has a description with the following optional sections:

+ `spec_header`, placed at the top of the .ads file
+ `spec_footer`, placed at the bottom of the .ads file
+ `body_header`, placed at the top of the .adb file
+ `body_footer`, placed at the bottom of the .adb file

### Diagrams

Diagrams inside a .drn file correspond to subprograms (functions or procedures), types or general declarations.

Diagrams consist of the following:

+ A single start icon and a single end icon
+ A parameter box to the right of the start icon
+ Action icons
+ Shelf icons (special meaning)
+ Insertion icons (nested declarations)
+ Loop icons
+ Select icons
+ If icons
+ Lines connecting icons

Each diagram has a description with the same optional sections as above.

### Parameter box

The parameter box containts:

+ First line: keywords, either from Ada or DRAKON Ada-specific
+ Middle lines: function parameters, one per line (without semicolons)
+ Last line: return type of a function after the keyword `return`

The DRAKON Ada-specific keywords appearing in the parameter box are:

+ `name:<name>`, which allows setting the name of the generated subprogram regardless of diagram name
  + Since diagram names must be unique, this is required for overloading
+ `order:<val>`, which allows manual control over the order in which declarations appear in the generated output
  + Default sorting is alphabetical
  + All declarations have `order:0` implicitly
  + To have something appear before/after, use negative/positive values for `order`
+ `local`, `nested` and `visible` which set declaration location (see below)

### Declaration location

Declaration location is controlled by three mutually-exclusive keywords:

+ `visible`: places a declaration in the visible part of a package
+ `private`: places a declaration in the private part of a package
+ `local`: places a declaration in the package body
+ `nested`: can only appear as a nested declaration using an insertion icon

The following considerations apply:

+ Subprograms and declarations implicitly default to `local`, while types implicitly default to `visible`.

### Declaration order

At each `order` level, declarations are generated in order:

+ First come partial views of private types, then types, then sybtypes.
+ Then come general declarations.
+ Then come subprograms.

### Shelves

In DRAKON Ada, shelf icons are used to represent syntax for which there are no icons, such as block begin/end, or special actions.

Available shelves are (single word in top box):

#### begin

Starts a block, empty bottom box.

#### end

Ends a block, optional block name in bottom box.

#### return

Starts an extended return statement, value declaration in bottom box.

#### for

Emits a representation clause, everything after 'for' in bottom box.
Used to have proper indentation of representation clauses included in the diagram defining a type (locality).

The following shelves are merged when present in succession:

#### when

Used to define a loop filter (Ada 2022), condition in bottom box. When merged takes 'and then' of all conditions.

#### enum

Not an Ada keyword. Used to easily define enumerations and their representation clauses, values in bottom box (one per line, no commas).

#### record

Used to define records, fields in bottom box (with semicolons, to support long initial values with line breaks).

#### exception

Used to define exception handlers, alternative in bottom box. When merged, all alternatives appear in definition order in a single `exception` block.

#### declare

Used to provide declarations in a `declare` block before `begin`, declarations in bottom box. May be intercalated with insertions.

#### with

Used to provide aspect specification, single clause (preferrably) in bottom box. When merged, all clauses appear separated by commas after `with`.

#### is

Used to provide declarations in the declarative region of a subprogram (between `is` and `begin`), declarations in bottom box.
Must appear at the top of a subprogram diagram. May be intercalated with insertions.
Also used to provide the (visible) partial view of a private type. If not present, a private type will have no partial view.

## Limitations

+ Nested functions cannot have insertion icons
  + Solving this would require setting up a topological sort to figure out the dependency order in which to generate code from diagrams.

## FAQ

Currently empty.
