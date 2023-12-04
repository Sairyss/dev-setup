if vim.g.vscode then
  -- Edit plugin configs when running neovim in VSCode (with Neovim VSCode extension)

  return {
    -- Edit configs
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        -- Disable highlight to avoid treesitter highlighting in VSCode
        highlight = { enable = false },
      },
    },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "",
      },
    },

    -- Disable plugins
    { "mini.animate", enabled = false },
    {
      "ThePrimeagen/harpoon",
      enabled = false,
    },
    { "CRAG666/code_runner.nvim", enabled = false },
    { "nvim-treesitter/playground", enabled = false },
    {

      "nvim-telescope/telescope.nvim",
      enabled = false,
    },
    {
      "mg979/vim-visual-multi",
      enabled = false,
    },
    {
      "kevinhwang91/rnvimr",
      enabled = false,
    },
    {
      "petertriho/nvim-scrollbar",
      enabled = false,
    },
    -- {
    --   "windwp/nvim-autopairs",
    --   enabled = false,
    -- },
    { "akinsho/toggleterm.nvim", enabled = false },
    {
      "stevearc/aerial.nvim",
      enabled = false,
    },
    {
      "neovim/nvim-lspconfig",
      enabled = false,
    },
    {
      "hrsh7th/nvim-cmp",
      enabled = false,
    },
    {
      "L3MON4D3/LuaSnip",
      enabled = false,
    },
    {
      "rafamadriz/friendly-snippets",
      enabled = false,
    },
    {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      enabled = false,
    },
    {
      "williamboman/mason.nvim",
      enabled = false,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      enabled = false,
    },
    {
      "hrsh7th/cmp-nvim-lsp",
      enabled = false,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      enabled = false,
    },
    {
      "folke/neodev.nvim",
      enabled = false,
    },
    {
      "folke/neoconf.nvim",
      enabled = false,
    },
    {
      "mfussenegger/nvim-dap",
      enabled = false,
    },
    {
      "folke/which-key.nvim",
      enabled = false,
    },
    {
      "folke/trouble.nvim",
      enabled = false,
    },
  }
else
  return {}
end
