local utils = require "user.utils"
local astro_utils = require "astronvim.utils"

return {
  -- first key is the mode
  n = {
    ['j'] = { 'jzz' },
    ['k'] = { 'kzz' },
    ['G'] = { 'Gzz' },
    ['Y'] = { 'y$' },
    ['<leader>w<leader>s'] = { '<cmd>w<cr> <cmd>source %<cr>', desc = 'Save and source' },
    ['<C-d>'] = { '<C-d>zz' },
    ['<C-u>'] = { '<C-u>zz' },
    -- disable default bindings
    ["<C-Down>"] = false,
    ["<C-Up>"] = false,
    ["<C-Right>"] = false,
    ["<C-Left>"] = false,
    ["<C-q>"] = false,
    ["<C-s>"] = false,
    -- Neotree
    ['<leader>e'] = false,
    ['<leader>pv'] = { '<cmd>Neotree toggle<cr>', desc = "Toggle Neotree" },
    -- better buffer navigation
    ["]b"] = false,
    ["[b"] = false,
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    -- better search
    n = { utils.better_search "n", desc = "Next search" },
    N = { utils.better_search "N", desc = "Previous search" },
    -- resize with arrows
    ["<S-Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
    ["<S-Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
    ["<S-Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
    ["<S-Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>c"] = false,
    ["<leader>bc"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
    ["<leader>bp"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    ["<leader>bw"] =
    { function() require("astronvim.utils.buffer").close_all(true) end, desc = "Close all buffers except current" },
    ["<leader>b"] = { name = "Buffers" },
    -- Lazygit
    ["<leader>gg"] = false,
    ["<leader>gitui"] = { function() astro_utils.toggle_term_cmd "lazygit" end, desc = "ToggleTerm lazygit" },
    -- Terminal
    ["<F7>"] = false,
    ["<leader>term"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    -- Buffer navigation
    ["<leader>1"] = {
      function() require("astronvim.utils.buffer").nav_to(1) end,
      desc = "Tab 1",
    },
    ["<leader>2"] = {
      function() require("astronvim.utils.buffer").nav_to(2) end,
      desc = "Tab 2",
    },
    ["<leader>3"] = {
      function() require("astronvim.utils.buffer").nav_to(3) end,
      desc = "Tab 3",
    },
    ["<leader>4"] = {
      function() require("astronvim.utils.buffer").nav_to(4) end,
      desc = "Tab 4",
    },
    ["<leader>5"] = {
      function() require("astronvim.utils.buffer").nav_to(5) end,
      desc = "Tab 5",
    },
    ["<leader>6"] = {
      function() require("astronvim.utils.buffer").nav_to(6) end,
      desc = "Tab 6",
    },
    ["<leader>7"] = {
      function() require("astronvim.utils.buffer").nav_to(7) end,
      desc = "Tab 8",
    },
    ["<leader>9"] = {
      function() require("astronvim.utils.buffer").nav_to(9) end,
      desc = "Tab 9",
    },
    -- Code actions
    ["<leader>la"] = false,
    ["<leader>ca"] = {
      function() vim.lsp.buf.code_action() end,
      desc = "LSP code action",
    },
    -- Signature help
    ["<leader>lh"] = false,
    ["<C-p>"] = {
      function() vim.lsp.buf.signature_help() end,
      desc = "Signature help",
    },
    -- Rename symbol
    ["<leader>lr"] = false,
    ["<leader>rn"] = {
      function() vim.lsp.buf.rename() end,
      desc = "Rename current symbol",
    },
    -- Command palette
    ["<leader>fC"] = false,
    ["<leader>cp"] = { function() require("telescope.builtin").commands() end, desc = "Command Palette" },
    -- Smart splits
    ["<C-h>"] = false,
    ["<leader>h"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
    ["<C-j>"] = false,
    ["<leader>j"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" },
    ["<C-k>"] = false,
    ["<leader>k"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" },
    ["<C-l>"] = false,
    ["<leader>l"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
  },
  t = {
    -- Toggle terminal
    ["<F7>"] = false,
    ["<leader>term"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
  },
  v = {
    -- Code actions
    ["<leader>la"] = false,
    ["<leader>ca"] = {
      function() vim.lsp.buf.code_action() end,
      desc = "LSP code action",
    },
  }
}
