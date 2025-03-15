return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",

  opts = {
    keymap = { preset = "default" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}
