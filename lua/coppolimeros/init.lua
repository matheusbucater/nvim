require("coppolimeros.remap")
require("coppolimeros.set")
require("coppolimeros.packer")

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight on yank',
    group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})
