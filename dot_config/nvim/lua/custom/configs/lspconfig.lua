local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {"html", "cssls", "sqlls", "stylelint_lsp", "terraformls", "prismals", "tailwindcss", "jsonls",
                 "eslint", "helm_ls", "dockerls", "docker_compose_language_service", "elixirls", "tsserver"}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end
