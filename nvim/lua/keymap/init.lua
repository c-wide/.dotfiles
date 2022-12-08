local helpers = require("keymap.helpers")
local nnoremap = helpers.nnoremap
local inoremap = helpers.inoremap
local vnoremap = helpers.vnoremap

local silent = { silent = true }

-- Return to netrw
nnoremap("<leader>e", ":E<CR>")

-- Telescope
nnoremap("<leader>ff", function()
	require("telescope.builtin").find_files()
end)

nnoremap("<leader>fg", function()
	require("telescope.builtin").live_grep()
end)

nnoremap("<leader>fb", function()
	require("telescope.builtin").buffers()
end)

nnoremap("<leader>fh", function()
	require("telescope.builtin").help_tags()
end)

-- :)
inoremap("<C-c>", "<Esc>")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("n", "nzz")

-- Harpoon
nnoremap("<leader>a", function()
	require("harpoon.mark").add_file()
end, silent)

nnoremap("<C-e>", function()
	require("harpoon.ui").toggle_quick_menu()
end, silent)

nnoremap("<C-h>", function()
	require("harpoon.ui").nav_file(1)
end, silent)
nnoremap("<C-j>", function()
	require("harpoon.ui").nav_file(2)
end, silent)
nnoremap("<C-k>", function()
	require("harpoon.ui").nav_file(3)
end, silent)
nnoremap("<C-l>", function()
	require("harpoon.ui").nav_file(4)
end, silent)

-- Toggleterm
nnoremap("<C-\\>", ":ToggleTerm<cr>")
nnoremap("<leader>th", ":ToggleTerm size=12 direction=horizontal<cr>")
nnoremap("<leader>tv", ":ToggleTerm size=50 direction=vertical<cr>")
nnoremap("<leader>tf", ":ToggleTerm direction=float<cr>")

-- Window navigation
nnoremap("<S-h>", "<C-w>h", silent)
nnoremap("<S-j>", "<C-w>j", silent)
nnoremap("<S-k>", "<C-w>k", silent)
nnoremap("<S-l>", "<C-w>l", silent)

-- Window resizing
nnoremap("<S-Up>", ":resize +2<cr>", silent)
nnoremap("<S-Down>", ":resize -2<cr>", silent)
nnoremap("<S-Left>", ":vertical resize +2<cr>", silent)
nnoremap("<S-Right>", ":vertical resize -2<cr>", silent)

-- Comment toggle
nnoremap("<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end)
vnoremap("<leader>/", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")

-- Terminal keybinds
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")

vim.keymap.set("t", "<S-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<S-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<S-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<S-l>", "<C-\\><C-n><C-w>l")
