SUBDIRS := drakon_ada_test \
	   geometry \
	   magic_moments \
	   sylvan_sorter \
	   rational_numbers \
	   rational_reckoner

.PHONY: regen
regen:
	$(foreach _,$(SUBDIRS) excerpts,(cd $_/src && $(MAKE));)

.PHONY: build
build:
	$(foreach _,$(SUBDIRS),(cd $_/src && alr build);)

.PHONY: test
test:
	$(foreach _,$(SUBDIRS),(cd $_/src && alr test);)
