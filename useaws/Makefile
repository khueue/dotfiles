__default:
	@ cat Makefile

SCRIPT_EXE=/usr/local/bin/useaws

install: uninstall
	sudo ln ./useaws $(SCRIPT_EXE)
	sudo chmod +x $(SCRIPT_EXE)

uninstall:
	rm -f $(SCRIPT_EXE)
