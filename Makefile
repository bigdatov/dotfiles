SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

backup-dconf: ## Backup dconf configurations
	dconf dump /org/gnome/ > ./.config/dconf/settings.dconf

backup-code: ## Backup VS Code extensions, settings, keybindings, and snippets
	code --list-extensions > ~/.config/Code/extensions.txt
	cp -r ~/.config/Code/User/snippets ./.config/Code/User/
	cp ~/.config/Code/User/keybindings.json ./.config/Code/User/keybindings.json
	cp ~/.config/Code/User/settings.json ./.config/Code/User/settings.json

backup: backup-dconf backup-code ## Backup dconf and VS Code configuration files

restore-dconf: ## Restore dconf settings
	dconf load /org/gnome/ < ./.config/dconf/settings.dconf

restore-code:  ## Restore VS Code settings, keybindings, and snippets
	cp -r ./.config/Code/User/snippets ~/.config/Code/User/
	cp ./.config/Code/User/keybindings.json ~/.config/Code/User/keybindings.json
	cp ./.config/Code/User/settings.json ~/.config/Code/User/settings.json

restore-exts:  ## Restore VS Code extensions
	bash ./scripts/vscode-exts.sh

restore: restore-dconf restore-code restore-exts ## Restore dconf and VS Code from backed up configs

setup:  ## Setup local Ubuntu install
	bash copy.sh
