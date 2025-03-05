return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "javascript",
        "typescript",
        "go",
        "python",
        "cpp",
        "html",
        "rust",
        "markdown",
        "yaml",
        "json",
        "bash",
        "dockerfile",
        "java",
        "kotlin",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
