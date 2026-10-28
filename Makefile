.PHONY: regen
regen:
	cd drakon_ada_test/src && $(MAKE)
	cd geometry/src && $(MAKE)
	cd magic_moments/src && $(MAKE)
