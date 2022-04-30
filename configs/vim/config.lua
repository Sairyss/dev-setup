--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- Key bindings

vim.cmd([[
  :set confirm
  :set hidden
  nnoremap <C-p> <Cmd>lua require("which-key").execute(1)<CR>
  nnoremap <M-p> <Cmd>Telescope git_status<CR>
  nnoremap <C-M-f> <Cmd>Telescope lsp_dynamic_workspace_symbols<CR>
  nnoremap <M-f> <Cmd>Telescope lsp_document_symbols<CR>
  nnoremap <S-M-f> <Cmd>Telescope live_grep<CR>
  nnoremap <silent> <C-w> :bd<CR>
  nnoremap <silent> <M-q> :b#<CR>
  nnoremap <silent> <C-M-p> <Cmd>Telescope buffers<CR>
  nnoremap <silent> <M-e> :BufferLineCycleNext<CR>
  nnoremap <silent> <M-w> :BufferLineCyclePrev<CR>
  nnoremap <silent> <S-M-Right> <C-w>l
  nnoremap <silent> <S-M-Left> <C-w>h
  nnoremap <silent> <M-a> <C-w>w
  nnoremap <silent> <M-E> <C-w>v
  nnoremap <silent> <M-D> <C-w>s
  nnoremap <silent> <M-W> <C-w>q
  nnoremap <silent> <C-_> <Cmd>lua require('Comment.api').toggle_current_linewise()<CR>
  nnoremap <silent> <F2> <Cmd> lua vim.lsp.buf.rename()<CR>
  nnoremap <silent> <C-d> <SNR>85_Visual('under')
  nnoremap <silent> <C-d> :<C-U>call vm#commands#ctrln(v:count1)<CR>
  nnoremap x "_x
  nnoremap <S-e> g_
  nnoremap <C-e> g_
  nnoremap <C-a> ^
  nnoremap <S-b> ^
  nnoremap <S-q> ^
  nnoremap q b
  nnoremap <S-r> <C-u>
  nnoremap <S-f> <C-d>
  nnoremap dq db
  nnoremap yq yb
  nnoremap dQ d^
  nnoremap cQ c^
  nnoremap vQ v^
  nnoremap yQ y^
  nnoremap cE c$
  nnoremap dE d$
  nnoremap vE v$
  nnoremap vq vb
  nnoremap n nzzzv
  nnoremap N Nzzzv
  nnoremap J mzJ`z
  nmap <Space>lc <Plug>(coc-fix-current)
  xmap <Space>lC <Plug>(coc-codeaction-selected)
  nmap <Space>lC <Plug>(coc-codeaction-selected)
  nnoremap <silent><nowait> <Space>e :RnvimrToggle<cr>
  nnoremap <silent><nowait> <Space>lD :<C-u>CocList diagnostics<cr>
  nnoremap <silent> <Space>gD :DiffviewOpen<CR>
  nnoremap <silent> <Space>gF :DiffviewClose<CR>
  nnoremap <silent> <Space>gL :0Gclog<CR>
  nnoremap <silent> f :HopWord<CR>
  nnoremap <silent> <C-g> :HopLine<CR>
  nnoremap <silent> <M-/> :HopChar1<CR>
  inoremap , ,<c-g>u
  inoremap . .<c-g>u
  inoremap ! !<c-g>u
]])
-- vnoremap d "_d // dd no longer copies deleted item
-- nnoremap d "_d

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarkpro"
lvim.builtin.terminal.direction = 'horizontal'
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = { ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true
-- lvim.builtin.treesitter.rainbow.extended_mode = true
lvim.builtin.treesitter.rainbow.colors = { "#e2be7a", "#b86eb8", "#6AA7EC" }

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]
-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
 local formatters = require "lvim.lsp.null-ls.formatters"
 formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
   {
     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
     command = "prettier",
     ---@usage arguments to pass to the formatter
     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
   },
 }

-- -- set additional linters
 local linters = require "lvim.lsp.null-ls.linters"
 linters.setup {
--   { command = "flake8", filetypes = { "python" } },
     {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
     },
    {
      command = "eslint_d",
      ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
      -- filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    },
  --   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
 }

-- Additional Plugins
lvim.plugins = {
     {"folke/tokyonight.nvim"},
     {
       "folke/trouble.nvim",
       cmd = "TroubleFoggle",
     },
    {"Th3Whit3Wolf/one-nvim"},
    {"marko-cerovac/material.nvim"},
    {"rafamadriz/neon"},
    {"olimorris/onedarkpro.nvim"},
    {"prettier/vim-prettier"},
    {"mg979/vim-visual-multi"},
    {"tpope/vim-fugitive"},
    {"p00f/nvim-ts-rainbow"},
    {"lukas-reineke/indent-blankline.nvim",
      config = function()
       require("indent_blankline").setup {
          space_char_blankline = " ",
          show_current_context = true,
          show_current_context_start = true,
      }
    end,
    },
    {"neoclide/coc.nvim", run = "yarn install --frozen-lockfile"},
    {"iamcco/coc-spell-checker" },
    {
      'wfxr/minimap.vim',
      run = "cargo install --locked code-minimap",
      -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
      config = function ()
        vim.cmd ("let g:minimap_width = 10")
        vim.cmd ("let g:minimap_auto_start = 1")
        vim.cmd ("let g:minimap_auto_start_win_enter = 1")
      end,
    },
    {
      "sindrets/diffview.nvim",
      event = "BufRead",
    },
    {
      "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        module = "persistence",
        config = function()
          require("persistence").setup {
            dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
            options = { "buffers", "curdir", "tabpages", "winsize" },
          }
      end,
    },
    {
      "folke/todo-comments.nvim",
      event = "BufRead",
      config = function()
        require("todo-comments").setup()
      end,
    },
    {
      "kevinhwang91/rnvimr",
        cmd = "RnvimrToggle",
        config = function()
          vim.g.rnvimr_draw_border = 1
          vim.g.rnvimr_pick_enable = 1
          vim.g.rnvimr_bw_enable = 1
          end,
    },
    {
      "phaazon/hop.nvim",
      event = "BufRead",
      config = function()
        require("hop").setup()
      end,
    },
 }

  lvim.builtin.which_key.mappings["S"]= {
    name = "Session",
    S = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
  }
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
