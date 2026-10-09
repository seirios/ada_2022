DRN_FILES := $(wildcard geometry*.drn)
ADB_FILES := $(subst .drn,.adb,$(DRN_FILES))
ADS_FILES := $(subst .drn,.ads,$(DRN_FILES))

.PHONY: all
all: $(ADB_FILES)

$(ADB_FILES): %.adb: %.drn $(HOME)/src/drakon_editor/generators/ada.tcl
	drakon-gen -in $< -ext adb
