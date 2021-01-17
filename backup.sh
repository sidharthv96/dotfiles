#!/usr/bin/env bash

code --list-extensions > vscode.md
brew bundle dump --describe --force --file ./Brewfile