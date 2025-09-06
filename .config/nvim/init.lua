require("config.options")
require("config.code_comments")
require("config.lazy")

vim.lsp.config("gopls", {
	settings = {
		gopls = {
			usePlaceholders = false,
			gofumpt = true,
		},
	},
})
