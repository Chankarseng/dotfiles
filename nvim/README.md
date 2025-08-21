# Kar Seng's Nvim configuration
## Prerequisites
- [Neovim](https://github.com/neovim/neovim) >= v0.10.0
- [Ripgrep](https://github.com/BurntSushi/ripgrep) 
- [Nerdfont](https://www.nerdfonts.com/) 
- [Lazygit](https://github.com/jesseduffield/lazygit) 

## Description
- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`

## How to install
1. Install Neovim, Ripgrep, Nerdfont
2. Create a folder at home directory `~/.config/nvim`
3. Git clone this repo into `~/.config/nvim` 
4. Run `Nvim`
5. Wait for installation of the packages
6. Use `:Mason` to install the necesseray LSP, Formatters and Linters
7. Use `:TSInstall` to install necesseray Treeshaker configurations (Use `:TSModuleInfo` to list down all treeshaker configuration)
8. Run `:Lazy sync` to update Nvim plugins

## How to configure new languages
1. In `lspconfig.lua`, add a new LSP for a new programming language, for example: Golang would be `gopls` in the `servers` array. List of LSP servers can be found [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)
2. Run `:Mason` to install the language servers and formatters if needed.
3. In `conform.lua`, add a new entry for the langauge to use which formatters, for example: Golang would be `go = { "gofmt" }`
