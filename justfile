# Set the default shell to bash
set shell := ["bash", "-cu"]

# Main project file
file := "tracking-tutorial"

# List all available recipes
default:
    @just --list

# Preview project on local server
preview:
    quarto preview {{file}}.md

# Render project to HTML
render:
    quarto render {{file}}.md --to html
