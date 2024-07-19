-- Indents
vim.opt.tabstop = 4;
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Line numbers
vim.opt.relativenumber = true

-- Search
vim.opt.hlsearch = true
vim.opt.smartcase = true

-- Hisory & Backup
vim.opt.backup = true
vim.opt.swapfile = false
vim.opt.backupdir = os.getenv("HOME") .. "/.cache/nvim/backup"
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undo"

-- Colors
vim.opt.termguicolors = true
vim.cmd.colorscheme "catppuccin-mocha"

-- Cursor
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.guicursor = "a:block"

-- Visual
vim.opt.colorcolumn = "100"
vim.opt.cmdheight = 1

-- Misc
vim.opt.completeopt = "menuone,noinsert,preview,noselect" -- TODO: What does this mean
vim.opt.exrc = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.scrolloff = 10
vim.opt.updatetime = 50
vim.opt.encoding = "utf-8"
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"

























