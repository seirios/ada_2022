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

+ Keywords, either Ada keywords or DRAKON Ada-specific keywords (first line)
+ Function parameter list (without semicolons)
+ The return type of a function after the keyword `returns` (last line)

The DRAKON Ada-specific keywords appearing in the parameter box are:

+ `#comment`, which prevents a diagram from being present in the generated output
  + But it is still checked for diagram correctness
+ `returns`, which specifies the return type of a function
  + Must be in the last line of the parameter box
+ `order`, which allows manual control over the order in which declarations appear in the generated output
  + Default order of generation is in alphabetical order
  + All declarations have `order:0` implicitly
  + To have something appear before, use negative values of `order`, e.g., `order:-1`
+ `nested`, which allows using diagrams to define subprograms that will be nested inside other subprograms
  + This appears in the parameter box of a subprogram to be nested, preventing its code from being present in the normal output
  + Also appears in the insertion icon, to signal that the code should be placed there

### Declaration visibility

Declaration visibility is controlled by three keywords present in the parameter box:

+ `visible` which places a declaration in the visible part of a package
+ `private` which places a declaration in the private part of a package
+ `local` which places a declaration in the package body only

The following conflicts exist:

+ `visible` and `local` is forbidden
+ `visible` and `private` is forbidden

The following considerations apply:

+ Subprograms implicitly default to `local`, while types implicitly default to `visible`.
+ A `private` and `local` type has its declaration only in the private part (no `is private` in the visible part).

### Declaration order

+ First come types, then sybtypes.
+ Then come general declarations (e.g., variables).
+ Then come subprograms.

## FAQ

Currently empty.
