return {
	{ -- Enable "auto-installation" of mason packages
		-- https://github.com/mason-org/mason-registry/tree/main/packages
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"gofumpt",
				"goimports",
				"goimports-reviser",
				"golines",
				"gopls",
                "html-lsp",
				"lua_ls",
				"pyright",
				"ruff",
				"stylua",
				"templ",
			},
		},
	},
	{ -- Helps auto-install and auto-enable "vim.lsp.enable()" LSPs
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		opts = {
			auto_install = true,
		},
	},
}
