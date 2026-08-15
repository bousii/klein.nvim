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
vim.lsp.config["rust_analyzer"] = {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml" },
}

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local buf = args.buf

		if client:supports_method('textDocument/definition') then
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = buf, desc = 'Go to definition' })
		end

		if client:supports_method('textDocument/declaration') then
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = buf, desc = 'Go to declaration' })
		end

		if client:supports_method('textDocument/references') then
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = buf, desc = 'Go to references' })
		end

		if client:supports_method('textDocument/implementation') then
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = buf, desc = 'Go to implementation' })
		end

		if client:supports_method('textDocument/hover') then
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = buf, desc = 'Hover' })
		end

		if client:supports_method('textDocument/completion') then
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
		end
	end,
})

vim.lsp.enable({
	"clangd",
	"pyright",
	"lua_ls",
	"gopls",
	"rust_analyzer",
})
