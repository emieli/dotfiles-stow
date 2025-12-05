vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Make "/" search case insensitive unless I enter uppercase letter
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

vim.opt.winborder = "rounded"

-- Set tabs to 4 spaces
vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- vim.opt.colorcolumn = "95"

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15

vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set("n", "L", '<cmd>echo "L was pressed"<CR>')
vim.keymap.set("n", "H", '<cmd>echo "H was pressed"<CR>')

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Run zz after scrolling to keep cursor in middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Jump to next/prev LSP diagnostic error, then center it on screen
vim.keymap.set("n", "<leader>tp", function()
	vim.diagnostic.jump({ count = -1, float = false })
	vim.api.nvim_input("zz")
end)
vim.keymap.set("n", "<leader>tn", function()
	vim.diagnostic.jump({ count = 1, float = false })
	vim.api.nvim_input("zz")
end)
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
	vim.api.nvim_input("zz")
end)

-- Exit :terminal with Escape key
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")

-- Close hover popup if we move the cursor or jump to other buffer with gd
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({
		-- Disabled as these commands have weird side effects elsewhere.
		-- close_events = { "CursorMoved", "BufHidden" },
		focusable = true,
		max_width = 80,
	})
end)
