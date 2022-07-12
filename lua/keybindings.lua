-- <leader> is '\' (back slash)


local keymap = vim.api.nvim_set_keymap
keymap('n', '<C-w>', ':w<CR>', {})
keymap('i', '<C-w>', '<ESC>:w<CR>', {})
keymap('n', '<C-q>', ':q<CR>', {})
keymap('n', '<C-u>', ':u<CR>', {})
keymap('i', '<C-u>', '<ESC>:u<CR>a', {})
keymap('n', '<ScrollWheelUp>', '<C-Y>', {})
keymap('n', '<ScrollWheelDown>', '<C-E>', {})
keymap('n', '<C-n>', ':Alpha<cr>', {noremap = true})
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', {})
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', {})
keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', {})
keymap('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', {})
keymap('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', {})
keymap('n', 'gr', ':lua vim.lsp.buf.references()<cr>', {})
keymap('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>', {})
keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>', {})
keymap('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', {})
keymap('n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>', {})
keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', {})
keymap('n', '<C-f>', ':Neotree right toggle<CR>', {})
keymap('i', '<C-f>', ':Neotree right toggle<CR>', {})
keymap('n', '<S-f>', ':Neotree float toggle<CR>', {})
keymap('n', '<leader>f', ':Telescope find_files<CR>', {})
keymap('n', '<leader>b', ':Telescope buffers<CR>', {})



local opts = { noremap = true, silent = true }
-- Move to previous/next
keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
