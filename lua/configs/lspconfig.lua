-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

require("lspconfig").ts_ls.setup {
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.stdpath "data" .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
        languages = { "vue" },
      },
    },
  },
}

local servers = {
  "vue_ls",
  "html",
  "cssls",
  "ts_ls",
  "eslint",
  "jsonls",
  "pyright",
  "prismals",
  "terraformls",
  "intelephense",
  "tailwindcss",
  "yamlls",
}

vim.lsp.enable(servers)
