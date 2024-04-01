return{

    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'williamboman/mason.nvim' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
    { "williamboman/mason-lspconfig.nvim" },
    { 'theprimeagen/vim-be-good' },
    { 'github/copilot.vim' },

    {
        'j-hui/fidget.nvim',
        opts = {
            notification =  {
                window = {
                    winblend = 0
                }
            }
        },
    },

    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end,
    },

    -- { 'tpope/vim-fugitive' },

    {
        'sudormrfbin/cheatsheet.nvim',

        dependencies = {
            {'nvim-telescope/telescope.nvim'},
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
        }
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    -- {
    --     'tjdevries/ocaml.nvim',
    --     config = function()
    --         require("ocaml").update()
    --     end
    -- },


}
