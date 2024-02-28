-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    J = { "mzJ`z" },
    n = { "nzzzv" },
    N = { "Nzzzv" },
    Q = { "<nop>" },
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },

    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>r"] = {
      name = "Run test (Java)",
    },
    ["<leader>rt"] = {
      function() require("jdtls").test_nearest_method() end,
      desc = "Nearest method",
    },
    ["<leader>rT"] = {
      function() require("jdtls").test_class() end,
      desc = "Class",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    J = { ":m '>+1<CR>gv=gv", desc = "Move selection down" },
    K = { ":m '<-2<CR>gv=gv", desc = "Move selection up" },
  },
  x = {
    ["<leader>p"] = { "\"_dP", desc = "Delete selection into void, paste over" }
  }
}
