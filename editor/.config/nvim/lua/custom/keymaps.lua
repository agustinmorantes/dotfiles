local nmap = function(keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

-- Insert new line in normal mode with Shift + Enter
vim.keymap.set('n', '<S-Enter>', 'o<ESC>', { silent = true })
vim.keymap.set('n', '<C-Enter>', 'O<ESC>', { silent = true })

-- Move line up and down with alt
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==')     -- move line up(n)
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')     -- move line down(n)
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv") -- move line down(v)

-- Save shortcut
vim.keymap.set('n', '<C-s>', ':w<CR>')

nmap('<leader>fm', vim.lsp.buf.format, '[F]or[m]at')

