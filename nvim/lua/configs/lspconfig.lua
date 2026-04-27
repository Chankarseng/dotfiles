-- load defaults i.e lua_lsp
local util = require "lspconfig.util"
require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("ts_ls", {
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
})

-- require("lspconfig").astro.setup {
--   root_dir = util.root_pattern("tsconfig.json", "package.json", ".git"),
--   init_options = {
--     typescript = {
--       tsdk = util.path.join(util.root_pattern "node_modules"(vim.fn.expand "%:p"), "node_modules", "typescript", "lib"),
--     },
--   },
-- }

local servers = {
  "vue_ls",
  "html",
  "cssls",
  "ts_ls",
  "vtsls",
  -- "eslint",
  "jsonls",
  "pyright",
  "prismals",
  "terraformls",
  "intelephense",
  "tailwindcss",
  "yamlls",
  "twiggy_language_server",
  "astro",
  "gopls",
}

vim.lsp.config("yamlls", {
  filetypes = { "yaml", "yml" },
  settings = {
    yaml = {
      schemaStore = {
        enable = true, -- keep this on for all other files
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = {
        -- this overrides the broken SchemaStore one specifically for bitbucket
        ["https://api.bitbucket.org/schemas/pipelines-configuration"] = "bitbucket-pipelines.yml",
      },
      keyOrdering = false,
    },
  },
})
vim.lsp.config("jsonls", {
  filetypes = { "json", "jsonc" },
  settings = {
    json = {
      -- Schemas https://www.schemastore.org
      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
        {
          fileMatch = { "tsconfig*.json" },
          url = "https://json.schemastore.org/tsconfig.json",
        },
        {
          fileMatch = {
            ".prettierrc",
            ".prettierrc.json",
            "prettier.config.json",
          },
          url = "https://json.schemastore.org/prettierrc.json",
        },
        {
          fileMatch = { ".eslintrc", ".eslintrc.json" },
          url = "https://json.schemastore.org/eslintrc.json",
        },
        {
          fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
          url = "https://json.schemastore.org/babelrc.json",
        },
        {
          fileMatch = { "lerna.json" },
          url = "https://json.schemastore.org/lerna.json",
        },
        {
          fileMatch = { "now.json", "vercel.json" },
          url = "https://json.schemastore.org/now.json",
        },
        {
          fileMatch = {
            ".stylelintrc",
            ".stylelintrc.json",
            "stylelint.config.json",
          },
          url = "http://json.schemastore.org/stylelintrc.json",
        },
      },
    },
  },
})

-- require("lspconfig").pyright.setup {
--   settings = {
--     python = {
--       venvPath = ".",
--       venv = ".venv",
--     },
--   },
-- }

vim.lsp.enable(servers)
