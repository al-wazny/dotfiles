return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	require('nvim-tree').setup({
	    view = {
		width = 60,
	    },
	    renderer = {
	        icons = {
	            glyphs = {
			folder = {
			    arrow_closed = "→", -- arrow when folder is closed
			    arrow_open = "↓", -- arrow when folder is open
		        },
		    },
	        },
             },
	})

	vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<CR>', { desc = '[T]oggle [T]ree' })
    end
}
