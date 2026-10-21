DRN_FILES := $(wildcard *.drn)
ADB_FILES := $(subst .drn,.adb,$(DRN_FILES))
ADS_FILES := $(subst .drn,.ads,$(DRN_FILES))

.PHONY: check
check:
	../bin/drakon_ada_test | diff -q - test.ok

.PHONY: all
all: $(ADB_FILES)

$(ADB_FILES): %.adb: %.drn $(HOME)/src/drakon_editor/generators/ada.tcl
	drakon-gen -in $< -ext adb
