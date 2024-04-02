return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local lspconfig = require('lspconfig')
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')
        local cmp = require('cmp')

        -- cmp setup
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = {
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            },
        })
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- mason setup
        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = {
                'tsserver',
                'quick_lint_js',
                'lua_ls',
                'rust_analyzer',
            },
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup{
                        capabilities = capabilities,
                    }
                end,
                lua_ls = function()
                    require('lspconfig').lua_ls.setup{
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = {'vim'},
                                },
                            },
                        }
                    }
                end,
            },
        })
    end,
}
