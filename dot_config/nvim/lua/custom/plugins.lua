local plugins = {
  {
    "neovim/nvim-lspconfig",
  
     dependencies = {
       "jose-elias-alvarez/null-ls.nvim",
       config = function()
         require "custom.configs.null-ls"
       end,
     },
   
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },  
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "bash",
        "fish",
        "dart",
        "dockerfile",
        "elixir",
        "git_config",
        "gitignore",
        "gitcommit",
        "go",
        "hcl",
        "jsonnet",
        "nix",
        "passwd",
        "php",
        "proto",
        "python",
        "rust",
        "sql",
        "scss",
        "terraform",
        "toml",
        "twig",
        "yaml"
      },
    },
  },
}

return plugins