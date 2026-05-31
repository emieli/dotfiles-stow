vim.lsp.config("gopls", {
	settings = {
		gopls = {
			staticcheck = true,
			gofumpt = true,
		},
	},
})
vim.lsp.enable("lua_ls", "gopls")
