-- https://www.lazyvim.org/configuration/general

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Colorscheme
vim.cmd("colorscheme evening")

-- General settings
local set = vim.opt
set.modeline = ture -- enable modeline for each file type
set.encoding = "utf-8"
set.fileencodings = "ucs-bom,utf-8,cp949,korea,iso-2022-kr"
set.et = true -- expandtab replace tab with spaces
set.nu = true -- show line numbers
set.relativenumber = false

set.hlsearch = true -- highlight search results
set.incsearch = true -- incremental search results
set.ignorecase = true -- ignore case when searching
set.smartcase = true -- ignore case when searching lowercase

set.history = 1000 -- set history size
set.undolevels = 1000 -- set undo levels
set.mouse = "a" -- enable mouse support
set.autoread = true -- auto read file when changed outside of vim
set.title = true -- set title of terminal to filename

set.foldmethod = "indent" -- fold based on indent

set.copyindent = true -- copy indent from current line
set.tabstop = 2 -- set tabstop to 2 spaces
set.shiftwidth = 2 -- set shiftwidth to 2 spaces
set.softtabstop = 2 -- set softtabstop to 2 spaces

set.cursorline = true -- highlight current line
set.colorcolumn = "120" -- set color column to 120
vim.cmd("highlight ColorColumn ctermbg=0 guibg=grey")

-- vim.cmd("autocmd BufWinEnter * match Error /\\s\\+$\\|^\\s*\\n\\+\\%$/") -- highlight trailing whitespace

-- Custom command
vim.cmd([[
  command Clear :%s/\s\+$//e
  command File echo expand('%:p')
  command! Ncd :cd %:p:h
]])

set.hidden = true -- allow hidden buffers
set.cmdheight = 3 -- set command height to 3
set.updatetime = 300 -- set updatetime to 300ms
set.shortmess:append("c") -- disable completion messages

set.signcolumn = "yes" -- enable sign column always

set.backup = false
set.writebackup = false
set.rtp:append("~/.fzf")

set.foldmethod = "indent"
set.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"

vim.g.copilot_no_tab_map = true
