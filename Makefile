# find out where ruby is. can override this by providing environment or command
# line variable
RUBY ?= $(shell ./find-ruby.sh)

.PHONY: help delete
default: help

delete:
	@echo going to remove the bundle directory. press ENTER to continue.
	@read something
	rm -rf bundle

NEOBUNDLE := bundle/neobundle.vim
${NEOBUNDLE}:
	mkdir -p bundle && cd bundle && git clone https://github.com/Shougo/neobundle.vim.git

.PHONY: cleanup compile-command-t compile

cleanup:
	vim -u bundles.vim +NeoBundleCheck +NeoBundleDocs

compile-command-t:
	test ! -d bundle/Command-T || (cd bundle/Command-T/ruby/command-t/ && $(RUBY) extconf.rb && make)

compile: compile-command-t

.PHONY: install reinstall

install: ${NEOBUNDLE} cleanup compile

reinstall: delete install

.PHONY: edit-bundles edit

edit-bundles:
	vim bundles.vim

edit: edit-bundles install

.PHONY: cleanup-bundles update-bundles update

cleanup-bundles:
	ls bundle | while read b;do (cd bundle/$$b && git clean -f);done

update-bundles: ${NEOBUNDLE}
	vim -u bundles.vim +NeoBundleUpdate

update: cleanup-bundles update-bundles install

.PHONY: help

help:
	@echo COMMON:
	@echo 'make help                        (default) print this message'
	@echo 'make install                     make sure all bundles installed and compiled'
	@echo 'make reinstall                   [DANGEROUS!] - remove bundles and reinstall'
	@echo 'make edit                        edit bundles file and install/refresh bundles'
	@echo 'make update                      update installed bundles'
