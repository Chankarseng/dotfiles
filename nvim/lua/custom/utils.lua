local M = {}

M.set_filetype = function()
  local filetypes = {
    "lua",
    "python",
    "javascript",
    "typescript",
    "go",
    "rust",
    "html",
    "css",
    "json",
    "yaml",
    "toml",
    "markdown",
    "bash",
    "cpp",
    "c",
    "java",
    "sql",
  }

  table.sort(filetypes)

  vim.ui.select(filetypes, { prompt = "Select filetype:" }, function(choice)
    if choice then
      vim.cmd("setfiletype " .. choice)
      print("Filetype set to: " .. choice)
    else
      print "No filetype selected."
    end
  end)
end

return M
