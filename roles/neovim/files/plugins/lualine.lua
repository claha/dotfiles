return {
  "nvim-lualine/lualine.nvim",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
  config = function()
    local lualine = require("lualine")
    lualine.setup({
      options = {
        theme = "auto",
      },
    })
  end,
}
