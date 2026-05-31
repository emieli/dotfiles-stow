-- Display first line of function at top-of-screen if inside long function.
-- Same with long for-loop, etc.
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
})
require("treesitter-context").setup{
    mode = "topline",
}
