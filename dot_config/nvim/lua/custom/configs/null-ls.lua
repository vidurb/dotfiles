-- custom/configs/null-ls.lua

local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
   formatting.prettier,
   formatting.stylua,

   lint.shellcheck,
}

null_ls.setup {
   debug = false,
   sources = sources,
}
