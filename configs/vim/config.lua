--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

vim.cmd([[
  :set wrap

  " Toggle between insert/normal modes with ESC
  nnoremap <Esc> i

  " Use 's' to enter insert mode ('i' still can be used)
  nnoremap s i

  " Use 'alt+s' to enter normal mode
  inoremap <a-s> <esc>

  " Move to start and back of the line with the same shortcuts as in a terminal
  nnoremap <C-e> g_
  nnoremap <C-a> ^

  " Deleting with X doesn't copy deleted character
  nnoremap x "_x

  " Navigating/selecting/copying/deleting forwards/backwards using e/E and q/Q
  nnoremap q b
  nnoremap E g_
  nnoremap Q ^
  nnoremap dq db
  nnoremap cq cb
  nnoremap yq yb
  nnoremap dQ d^
  nnoremap cQ c^
  nnoremap yQ y^
  nnoremap cE c$
  nnoremap dE d$
  vnoremap Q ^
  vnoremap E $
  vnoremap q b

  " Navigating using ijkl instead of hjkl
  " since its similar to wasd and arrow keys
 "nnoremap h i
 "nnoremap k j
 "nnoremap j h
 "nnoremap i k
 "vnoremap h i
 "vnoremap k j
 "vnoremap j h
 "vnoremap i k

  " Navigating to the start of the line using B since ^ is hard to reach
  nnoremap B ^

  " Centering screen view when moving
  nnoremap { {zz
  nnoremap } }zz

  " Yank everything to the end of the line (excluding newline)
  " noremap Y y$

  " Select everything between using ctrl+a. Pressing alt+a then ) will select
  " everything between parentheses, pressing alt+a and ' will select everything
  " betwen single quotes, etc.
  nnoremap <a-a> vi
  inoremap <a-a> <esc>vi

  " Centering screen when performing a search
  nnoremap n nzzzv
  nnoremap N Nzzzv
  nnoremap J mzJ`z

  " Create an undo checkpoint when writing certain characters
  inoremap , ,<c-g>u
  inoremap . .<c-g>u
  inoremap ! !<c-g>u
  inoremap ; ;<c-g>u

  " Move selected text line up and down using alt + j/k
  vnoremap <M-j> :m '>+1<CR>gv=gv
  vnoremap <M-k> :m '<-2<CR>gv=gv

  " Neovide settings
  if exists("g:neovide")
  " let g:neovide_cursor_animation_length=0.2
  " let g:neovide_cursor_trail_size=0.2
  endif

  " --- Lvim Bindings ---

  " Find files in a project
  nnoremap <C-p> <cmd>Telescope find_files<cr>
  inoremap <C-p> <cmd>Telescope find_files<cr>

  " --- Buffers ---
  nnoremap <silent> <C-w> :bd<CR> " close buffer
  nnoremap <silent> <M-q> :b#<CR> " Switch to last buffer
  nnoremap <silent> <M-e> :BufferLineCycleNext<CR>
  nnoremap <silent> <M-w> :BufferLineCyclePrev<CR>

  " --- Telescope bindings ---
  nnoremap <M-p> <Cmd>Telescope git_status<CR>
  nnoremap <C-M-f> <Cmd>Telescope lsp_dynamic_workspace_symbols<CR>
  nnoremap <silent> <C-M-p> <Cmd>Telescope buffers<CR>

  " --- Others ---
  nnoremap <silent> <F2> <Cmd> lua vim.lsp.buf.rename()<CR>
  nnoremap <silent> <a-,> :HopWord<CR>
  nnoremap <C-f> /
  inoremap <C-f> <Esc>/
  nnoremap <silent> <M-t> :ToggleTerm<CR>
]])

lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["r"] = { ":RnvimrToggle<cr>", "Ranger" }

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  S = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}
-- general
vim.opt.guifont = { "Fira Code Retina", ":h11" }
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"
lvim.builtin.terminal.direction = 'horizontal'
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

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
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.nvimtree.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- Enable spelling
vim.opt.spell = true
vim.opt.spelllang = { "en" }
vim.opt.spelloptions = "camel"

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
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.rainbow.enable = true
vim.opt.termguicolors = true

lvim.builtin.treesitter.rainbow.colors = { "#e2be7a", "#b86eb8", "#6AA7EC" }
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

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
    --     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    --     ---@usage arguments to pass to the formatter
    --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    --     extra_args = { "--print-with", "100" },
    --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
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
    --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "typescript", "javascript", "javascriptreact", "vue" },
  },
}
local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    exe = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
  },
}
-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleFoggle",
  },

  { "prettier/vim-prettier" },
  { "mg979/vim-visual-multi" },
  { "tpope/vim-fugitive" },
  { "p00f/nvim-ts-rainbow" },
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
  }, {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
    end,
  }, {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
    end,
  },
  -- {
  --   "mickael-menu/zk-nvim",
  --   config = function()
  --     require("zk").setup({
  --       -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
  --       -- it's recommended to use "telescope" or "fzf"
  --       picker = "telescope",

  --       lsp = {
  --         -- `config` is passed to `vim.lsp.start_client(config)`
  --         config = {
  --           cmd = { "zk", "lsp" },
  --           name = "zk",
  --           -- on_attach = ...
  --           -- etc, see `:h vim.lsp.start_client()`
  --         },

  --         -- automatically attach buffers in a zk notebook that match the given filetypes
  --         auto_attach = {
  --           enabled = true,
  --           filetypes = { "markdown" },
  --         },
  --       },
  --     })
  --   end,
  -- },
  {
    'abecodes/tabout.nvim',
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = '<C-d>', -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = '`', close = '`' },
          { open = '(', close = ')' },
          { open = '[', close = ']' },
          { open = '{', close = '}' }
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
      }
    end,
    wants = { 'nvim-treesitter' }, -- or require if not used so far
    after = { 'nvim-cmp' } -- if a completion plugin is using tabs load it before
  },
  -- {
  --   'nanotee/sqls.nvim',
  --   config = function()
  --     require('lspconfig').sqls.setup {
  --       on_attach = function(client, bufnr)
  --         require('sqls').on_attach(client, bufnr)
  --       end,
  --       settings = {
  --         sqls = {
  --           connections = {
  --             {
  --               driver = 'postgresql',
  --               dataSourceName = 'host=127.0.0.1 port=5432 user=user password=password sslmode=disable',
  --             },
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
