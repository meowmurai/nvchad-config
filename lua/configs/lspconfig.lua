-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "gopls", "bufls", "eslint", "pyright", "prismals" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern ".git",
  }
end

-- typescript
lspconfig.ts_ls.setup {
  on_init = on_init,
  root_dir = lspconfig.util.root_pattern ".git",
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    -- client.resolved_capabilities.document_formatting = false
    client.server_capabilities.documentFormattingProvider = false
  end,
  capabilities = capabilities,
  handlers = {
    ["textDocument/definition"] = function(err, result, method, ...)
      if vim.tbl_islist(result) and type(result) ~= "table" and #result > 1 then
        local filtered = {}
        for _, v in pairs(result) do
          if string.match(v.targetUri, "global.d.ts") or string.match(v.targetUri, "react/index.d.ts") == nil then
            table.insert(filtered, v)
          end
        end
        return vim.lsp.handlers["textDocument/definition"](err, filtered, method, ...)
      end
      vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
    end,
  },
}

-- Python
lspconfig.pyright.setup {
  root_dir = lspconfig.util.root_pattern ".git",
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        -- diagnosticMode = "off",
        typeCheckingMode = "basic",
        useLibraryCodeForTypes = false,
      },
    },
  },
}

lspconfig.eslint.setup {
  root_dir = lspconfig.util.root_pattern(".eslintrc.json", ".eslintrc.js", ".git") or vim.fn.getcwd(),
  settings = {
    packageManager = "yarn",
    nodePath = ".yarn/sdks",
  },
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    -- client.resolved_capabilities.document_formatting = true
  end,
  capabilities = capabilities,
}

require("lspconfig").tailwindcss.setup {
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cva\\(((?:[^()]|\\([^()]*\\))*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
          { "cx\\(((?:[^()]|\\([^()]*\\))*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
        },
      },
    },
  },
}
