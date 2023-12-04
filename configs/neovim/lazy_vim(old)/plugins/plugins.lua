return {
  {
    "abecodes/tabout.nvim",
    lazy = false,
    config = function()
      require("tabout").setup({
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
    },
  },
  { "nvim-treesitter/playground" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
        "regex",
        "query",
        "sql",
        "prisma",
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        path_display = { "truncate" },
      },
    },
  },
  {
    "mg979/vim-visual-multi",
  },
  {
    "kevinhwang91/rnvimr",
  },
  {
    "petertriho/nvim-scrollbar",
    version = false,
    config = function()
      require("scrollbar").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("aerial").setup({
        -- open_automatic = true,
        attach_mode = "global",
        layout = {
          max_width = { 40, 0.2 },
          min_width = 30,
        },
      })
    end,
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "ThePrimeagen/harpoon",
  },
  { "CRAG666/code_runner.nvim", config = true },

  --  Disable plugins
  { "mini.animate", enabled = false },
}
