DRN_FILES := $(wildcard *.drn)
ADB_FILES := $(subst .drn,.adb,$(DRN_FILES))

ADS_FILES := page.ads
ADB_FILES := $(filter-out $(subst .ads,.adb,$(ADS_FILES)),$(ADB_FILES))

.PHONY: all
all: $(ADB_FILES) $(ADS_FILES)

$(ADB_FILES): %.adb: %.drn $(HOME)/src/drakon_editor/generators/ada.tcl
	drakon-gen -in $< -ext adb

$(ADS_FILES): %.ads: %.drn $(HOME)/src/drakon_editor/generators/ada.tcl
	drakon-gen -in $< -ext ads
