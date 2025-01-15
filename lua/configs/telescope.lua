local telescope = require "telescope"

telescope.setup {
  defaults = {
    file_ignore_patterns = { ".git/" },
    find_command = { "fd", "--type", "f", "--hidden", "--follow", "--ignore-file", ".gitignore" },
    layout_config = {
      horizontal = {
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },
  },
}
