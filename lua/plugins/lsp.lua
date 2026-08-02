vim.lsp.config["clangd"] = {
	cmd = { "clangd" },
	filetypes = { "c", "cpp" }
}
vim.lsp.config["pyright"] = {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" }
}
vim.lsp.config["lua_ls"] = {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
}
vim.lsp.config["gopls"] = {
	cmd = { 'gopls' },
	filetypes = { 'go' },
}
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

vim.lsp.enable({
	"clangd",
	"pyright",
	"lua_ls",
	"gopls"
})
