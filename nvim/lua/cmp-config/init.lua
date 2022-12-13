local cmp = require("cmp")
local lspkind = require("lspkind")
local helpers = require("keymap.helpers")
local nnoremap = helpers.nnoremap
local inoremap = helpers.inoremap

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-n>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item()
			end
		end, { "i", "s" }),
		["<C-p>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 50,
		}),
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function extend_config(config)
	return vim.tbl_deep_extend("force", {
		capabilities = capabilities,
		on_attach = function()
			nnoremap("<leader>vd", function()
				vim.diagnostic.open_float()
			end)
			nnoremap("[d", function()
				vim.diagnostic.goto_next()
			end)
			nnoremap("]d", function()
				vim.diagnostic.goto_prev()
			end)
			nnoremap("gd", function()
				vim.lsp.buf.definition()
			end)
			nnoremap("K", function()
				vim.lsp.buf.hover()
			end)
			nnoremap("<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end)
			nnoremap("<leader>vca", function()
				vim.lsp.buf.code_action()
			end)
			nnoremap("<leader>vrr", function()
				vim.lsp.buf.references()
			end)
			nnoremap("<leader>vrn", function()
				vim.lsp.buf.rename()
			end)
			inoremap("<C-h>", function()
				vim.lsp.buf.signature_help()
			end)
		end,
	}, config or {})
end

require("lspconfig").sumneko_lua.setup(extend_config({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
}))

require("lspconfig").tsserver.setup(extend_config())

require("lspconfig").gopls.setup(extend_config({
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}))

require("lspconfig").rust_analyzer.setup(extend_config())

require("lspconfig").jedi_language_server.setup({})
