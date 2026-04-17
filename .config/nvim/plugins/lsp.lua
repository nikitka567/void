local nvim_lsp = require'lspconfig'

--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--	vim.lsp.diagnostic.on_publish_diagnostics, {
--		virtual_text = false
--	}
-- )
require("mason").setup()
require("mason-lspconfig").setup({})

