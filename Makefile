SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

backup-dconf: ## Backup dconf settings to ~/.config/dconf/settings.dconf
	dconf dump /org/gnome/ > ./.config/dconf/settings.dconf

backup-code: ## Backup a list of VS Code extensions to ~/.config/Code/extensions.txt
	code --list-extensions > ~/.config/Code/extensions.txt
	cp -r ~/.config/Code/User/snippets ./.config/Code/User/
	cp ~/.config/Code/User/keybindings.json ./.config/Code/User/keybindings.json
	cp ~/.config/Code/User/settings.json ./.config/Code/User/settings.json

backup: backup-dconf backup-code ## Backup dconf and VS Code extensions files

restore-dconf: ## Restore dconf settings from ~/.config/dconf/settings.dconf
	dconf load /org/gnome/ < ./.config/dconf/settings.dconf

restore-code:  ## Restore VS Code settings, keybingins, and snippets
	cp -r ./.config/Code/User/snippets ~/.config/Code/User/
	cp ./.config/Code/User/keybindings.json ~/.config/Code/User/keybindings.json
	cp ./.config/Code/User/settings.json ~/.config/Code/User/settings.json

setup:  ## Setup local Ubuntu install
	bash copy.sh
