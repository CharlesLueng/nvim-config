local M = {}

M.on_attach = function(client, bufnr)
	-- print("on_attach")
	M.load_keymaps(bufnr)
end

M.load_keymaps = function(bufnr)
	local map = vim.keymap.set

	-- map("n", "K", function()
	-- 	vim.lsp.buf.hover()
	-- end, { buffer = bufnr, desc = "Lsp hober" })
	map("n", "K", "<cmd>Lspsaga hover_doc<cr>", { buffer = bufnr, desc = "Lsp hober" })

	map("n", "[d", function()
		require("lspsaga.diagnostic"):goto_prev()
		-- vim.diagnostic.goto_prev({ float = { border = "rounded" } })
	end, { buffer = bufnr, desc = "Goto prev" })

	map("n", "]d", function()
		require("lspsaga.diagnostic"):goto_next()
		-- vim.diagnostic.goto_next({ float = { border = "rounded" } })
	end, { buffer = bufnr, desc = "Goto next" })

	map("n", "[e", function()
		require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
		-- vim.diagnostic.goto_prev({ float = { border = "rounded" } })
	end, { buffer = bufnr, desc = "Goto prev" })

	map("n", "]e", function()
		require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
		-- vim.diagnostic.goto_next({ float = { border = "rounded" } })
	end, { buffer = bufnr, desc = "Goto next" })

	map("n", "gD", function()
		vim.lsp.buf.declaration()
	end, { buffer = bufnr, desc = "LSP declaration" })

	map("n", "gd", "<cmd>Lspsaga peek_definition<cr>", { buffer = bufnr, desc = "LSP definition" })

	map("n", "gi", function()
		require("telescope.builtin").lsp_implementations()
	end, { buffer = bufnr, desc = "LSP implementation" })

	map("n", "<leader>ls", function()
		require("telescope.builtin").lsp_document_symbols()
		-- vim.lsp.buf.signature_help()
	end, { buffer = bufnr, desc = "[D]ocument [S]ymbols" })

	map("n", "<leader>D", function()
		vim.lsp.buf.type_definition()
	end, { buffer = bufnr, desc = "LSP definition type" })

	map("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", { buffer = bufnr, desc = "LSP rename" })

	map("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { buffer = bufnr, desc = "LSP code action" })

	map("n", "gr", function()
		require("telescope.builtin").lsp_references()
	end, { buffer = bufnr, desc = "LSP references" })

	map("n", "<leader>ld", function()
		vim.diagnostic.open_float({ border = "rounded" })
	end, { buffer = bufnr, desc = "Floating diagnostic" })

	map("n", "<leader>lf", function()
		require("conform").format({ async = true, lsp_fallback = true })
		-- vim.lsp.buf.format({ async = true })
	end, { buffer = bufnr, desc = "LSP formatting" })
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

M.capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	-- rangeLimit = 5000,
	lineFoldingOnly = true,
}

return M
