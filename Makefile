.PHONY: regen
regen:
	cd drakon_ada_test/src && $(MAKE)
	cd geometry/src && $(MAKE)
	cd magic_moments/src && $(MAKE)
	cd sylvan_sorter/src && $(MAKE)

.PHONY: build
build:
	cd drakon_ada_test && alr build
	cd magic_moments && alr build
	cd sylvan_sorter && alr build
