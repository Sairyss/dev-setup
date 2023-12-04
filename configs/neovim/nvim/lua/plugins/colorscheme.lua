return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",
        styles = {
          functions = {},
        },
        sidebars = { "qf", "vista_kind", "terminal", "packer" },
        on_colors = function(colors)
          -- colors.bg = "#1c1e26"
          -- colors.bg_sidebar = "#1e2028"
        end,

        on_highlights = function(hl)
          hl["@keyword"].fg = "#ba72d0"
          hl["@constructor"].fg = "#ba72d0"
          hl["@lsp.type.variable"].fg = "#d19a65"
          -- hl["@lsp.type.interface"].fg = "#e5bf7a"
          -- hl.Type.fg = "#00c99e"
        end,
      })
    end,
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "cool",
        colors = {
          -- green = "#00c99e",
          bg0 = "#1e2028",
          -- bg1 = "#1e2028",
          bg2 = "#1e2028",
          bg3 = "#27444d",
        },
        on_colors = function(colors)
          colors.bg = "#1c1e26"
          colors.bg_sidebar = "#1e2028"
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
