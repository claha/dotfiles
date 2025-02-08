return {
  "ibhagwan/fzf-lua",
  config = function()
    vim.keymap.set("n", "<leader>ff", "<CMD>FzfLua files<CR>")
  end,
}
