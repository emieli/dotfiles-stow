return {
	{ "geigerzaehler/tree-sitter-jinja2" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = { "go", "gomod", "gowork", "gosum", "lua", "vim", "vimdoc" },
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
