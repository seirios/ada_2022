SUBDIRS := drakon_ada_test \
	   geometry \
	   magic_moments \
	   sylvan_sorter \
	   rational_numbers

.PHONY: regen
regen:
	$(foreach _,$(SUBDIRS),(cd $_/src && $(MAKE));)

.PHONY: build
build:
	$(foreach _,$(SUBDIRS),(cd $_/src && alr build);)
