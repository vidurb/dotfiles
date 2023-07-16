local plugins = {{
    "neovim/nvim-lspconfig",
    dependencies = {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require "custom.configs.null-ls"
        end
    },
    config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
    end
}, {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {"vim", "lua", "html", "css", "javascript", "typescript", "tsx", "json", "bash", "fish",
                            "dart", "dockerfile", "elixir", "git_config", "gitignore", "gitcommit", "go", "hcl",
                            "jsonnet", "nix", "passwd", "php", "proto", "python", "rust", "sql", "scss", "terraform",
                            "toml", "twig", "yaml"}
    }
}, {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {"lua-language-server", "actionlint", "commitlint", "css-lsp",
                            "docker-compose-language-service", "dockerfile-language-server", "elixir-ls", "eslint-lsp",
                            "firefox-debug-adapter", "gh", "hadolint", "html-lsp", "helm-ls", "json-lsp",
                            "markdown-toc", "markdownlint", "misspell", "prettierd", "prisma-language-server", "ruff",
                            "shellcheck", "sqlfmt", "sqlls", "stylelint", "stylelint-lsp",
                            "tailwindcss-language-server", "terraform-ls", "typescript-language-server", "yamllint"}
    }
}}

return plugins
