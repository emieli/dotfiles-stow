require("config.options")
require("plugins.catppuccin")
require("plugins.autopairs")
require("plugins.mason")
require("plugins.telescope")
require("config.lsp")

vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})
