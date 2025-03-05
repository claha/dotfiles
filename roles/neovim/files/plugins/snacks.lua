return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    indent = {
      enabled = true,
    },
  },
  keys = {
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
    },
    {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
    },

    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
    },
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end,
    },
    {
      "<leader>sj",
      function()
        Snacks.picker.jumps()
      end,
    },

    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
    },

    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
    },
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
    },
  },
}
