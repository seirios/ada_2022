# DRAKON Ada

DRAKON Ada is a visual programming language that combines the user-friendliness and understandability of DRAKON diagrams with the power and correcteness of Ada.

## Manual

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
  + Can be active or inactive (greyed out)
+ Shelf icons (special actions)
  + Can be active or inactive (greyed out)
+ Insertion icons (nested subprograms)
  + Can be active or inactive (greyed out)
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

## Limitations

+ Nested functions cannot have insertion icons
  + Solving this would require setting up a topological sort to figure out the dependency order in which to generate code from diagrams.

## FAQ

Currently empty.
