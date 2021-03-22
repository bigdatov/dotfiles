SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

backup-dconf: ## Backup dconf settings to ~/.config/dconf/settings.dconf
	dconf dump /org/gnome/ > ~/.config/dconf/settings.dconf

backup-vsce: ## Backup a list of VS Code extensions to ~/.config/Code/extensions.txt
	ls ~/.vscode/extensions/ > ~/.config/Code/extensions.txt

backup: ## Backup dconf and VS Code extensions files
	save-dconf save-vsce 

restore-dconf: ## Restore dconf settings from ~/.config/dconf/settings.dconf # TODO copy it from dotfiles repo
	dconf load /org/gnome/ < ~/.config/dconf/settings.dconf

setup:  ## Setup local Ubuntu install
	bash copy.sh

