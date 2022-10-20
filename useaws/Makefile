__default:
	@ cat Makefile

SCRIPT_EXE=/usr/local/bin/useaws

install: uninstall
	ln ./useaws $(SCRIPT_EXE)
	chmod +x $(SCRIPT_EXE)

uninstall:
	rm -f $(SCRIPT_EXE)
