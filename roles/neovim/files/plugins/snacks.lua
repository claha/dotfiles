return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
    },
  },
}
