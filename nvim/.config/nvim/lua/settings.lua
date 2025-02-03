-- GLOBAL EDITOR SETTINGS:

-- Sets the leader to space bar
vim.g.mapleader        = " "
vim.g.maplocalleader   = " "

vim.g.have_nerd_font   = true



-- EDITOR OPTIONS:

-- Unifies the system and NeoVim clipboard
vim.opt.clipboard      = "unnamedplus"

-- Highlight the line currently containing the cursor
vim.opt.cursorline     = true

-- Show line numbers
vim.opt.number         = true

-- Use _ spaces for tab
vim.opt.tabstop        = 2
vim.opt.shiftwidth     = 2
vim.opt.shiftround     = true
vim.opt.expandtab      = true

vim.opt.conceallevel   = 2
vim.opt.breakindentopt      = "list:-1"
vim.opt.confirm             = true
vim.opt.completeopt         = "menuone,noinsert"
vim.opt.expandtab           = true
vim.opt.fillchars           = { foldopen=" ", foldclose="", fold=" ", foldsep=" ", diff="╱", eob=" " }

vim.opt.foldexpr       = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel      = 99
vim.opt.foldmethod     = "expr"
vim.opt.foldnestmax    = 10
vim.opt.foldtext       = ""

vim.opt.formatoptions  = "jcroqlnt"
vim.opt.grepformat     = "%f:%l:%c:%m"
vim.opt.grepprg        = "rg --vimgrep"
vim.opt.inccommand     = "split"
vim.opt.listchars      = { tab="  ", trail="·", nbsp="␣" }
vim.opt.scrolloff      = 4
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

vim.opt.splitbelow     = true
vim.opt.splitright     = true
