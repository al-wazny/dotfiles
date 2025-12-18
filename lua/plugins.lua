return {
    {
	'mrcjkb/rustaceanvim',
	version = '^5',
	lazy = false,
	ft = "rust",
	config = function ()
	    -- $HOME/.local/share/nvim/mason/packages/
	    local mason_registry = vim.fn.expand("$MASON/packages/")
	    local extension_path = mason_registry .. "codelldb/extension/"
	    local codelldb_path = extension_path .. "adapter/codelldb"
	    local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
	    local cfg = require('rustaceanvim.config')

	    vim.g.rustaceanvim = {
		dap = {
		    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
		},
	    }
	end
    },
    {
	'rust-lang/rust.vim',
        ft = "rust",
	init = function ()
	    vim.g.rustfmt_autosave = 1
        end
    },
    {
	'mfussenegger/nvim-dap',
	dependencies = {
	    "rcarriga/nvim-dap-ui",
	    {
	      "theHamsta/nvim-dap-virtual-text",
	      opts = {},
	    },
	},
	config = function()
	    local dap, dapui = require("dap"), require("dapui")
	    dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	    end
	    dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	    end
	    dap.listeners.before.event_terminated.dapui_config = function()
	        dapui.close()
	    end
	    dap.listeners.before.event_exited.dapui_config = function()
	        dapui.close()
	    end
	end
    },
    {
	'rcarriga/nvim-dap-ui',
	dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
	config = function()
	    require("dapui").setup()
	end
    },
    {
	'nvim-tree/nvim-tree.lua',
	dependencies = {'nvim-tree/nvim-web-devicons'},
	config = function()
	    vim.g.loaded_netrw = 1
	    vim.g.loaded_netrwPlugin = 1

	    require('nvim-tree').setup({
		view = {
		    width = 30,
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
}
