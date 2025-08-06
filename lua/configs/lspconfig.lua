require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "eslint",
  "jsonls",
  "pyright",
  "prismals",
  "terraformls",
  "vue_ls",
  "intelephense",
  "tailwindcss",
  "yamlls",
}

vim.lsp.enable(servers)
