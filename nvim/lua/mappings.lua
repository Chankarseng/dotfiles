require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local gitsigns = require "gitsigns"
local nomap = vim.keymap.del
local utils = require "custom.utils"

nomap("n", "<C-n>")
nomap("n", "<leader>v")
nomap("n", "<leader>h")

-- Map ; to enter command mode
map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "gd", vim.lsp.buf.definition, { desc = "LSP goto definition", noremap = true, silent = true })

-- Editor split
map("n", "<leader>vs", "<Cmd>vsplit<CR>")
map("n", "<leader>hs", "<Cmd>split<CR>")
map("n", "<C-I>", "<C-I>", { noremap = true })
map("n", "<C-O>", "<C-O>", { noremap = true })

-- Neotree
map("n", "<C-b>", "<Cmd>Neotree toggle<CR>", { noremap = true, silent = true })

map({ "n", "i", "t" }, "<C-p>", "<cmd>Telescope find_files hidden=true <cr>", { desc = "telescope find files" })
map("n", "dd", '"_dd', { noremap = true })
map({ "n", "v" }, "d", '"_d', { noremap = true })
-- map({ "n", "v", "t" }, "<leader>git", function()
--   require("nvchad.term").toggle {
--     pos = "sp",
--     id = "git_floating",
--     cmd = "lazygit",
--     size = 0.7,
--   }
-- end, { desc = "Toggle floating lazy git window" })
-- Git Signs
map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
map("n", "<leader>hb", function()
  gitsigns.blame_line { full = true }
end)

-- Hover
map("n", "K", require("hover").hover, { desc = "hover.nvim" })
map("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
map("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
-- map("n", "<C-p>", function()
--   require("hover").hover_switch "previous"
-- end, { desc = "hover.nvim (previous source)" })
-- map("n", "<C-n>", function()
--   require("hover").hover_switch "next"
-- end, { desc = "hover.nvim (next source)" })

-- Undotree
map({ "n", "v" }, "<leader>ut", vim.cmd.UndotreeToggle)

map("n", "ft", utils.set_filetype, { desc = "Set filetype" })

-- To quit all LSP clients for current buffer
map("n", "<leader>ql", function()
  for _, client in pairs(vim.lsp.get_clients { bufnr = 0 }) do
    client.stop(client)
  end
  vim.notify("Detached LSP from current buffer", vim.log.levels.INFO)
end, { desc = "Stop LSP for this buffer" })

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code actions" })

-- UFO Configuration
map("n", "zR", require("ufo").openAllFolds)
map("n", "zM", require("ufo").closeAllFolds)
