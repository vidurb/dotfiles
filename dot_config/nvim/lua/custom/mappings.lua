local M = {}

M.general = {
  n = {
    ["<leader>gn"] = { "<cmd> Neogit <CR>", "Open Neogit", opts = {} },
    ["<leader>gp"] = { "<cmd> Octo pr list <CR>", "View Pull Requests", opts = {} },
    ["<leader>gi"] = { "<cmd> Octo issue list <CR>", "View Issues", opts = {} },
  },
}

return M
