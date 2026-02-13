require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.relativenumber = true
o.number = true
o.ic = true
o.cursorlineopt = "both"
o.swapfile = false

o.foldcolumn = "0"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.fillchars = [[eob: ,fold: ,foldopen:▾,foldsep: ,foldclose:▸]]
