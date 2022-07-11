-- ----- REQUIREMENTS -----
--  a nerd font, enabled in terminal or whatever
--  packer:           yay -S nvim-packer-git
--  xclip:            yay -S xclip
--  git, curl or wget, unzip, tar, gzip, npm


require('keybindings')
require('packages')
require('config')




-- Cattpuccin
local catppuccin = require("catppuccin")
catppuccin.setup()
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.cmd [[colorscheme catppuccin]]




-- BUFFERLINE
vim.opt.termguicolors = true
--require("bufferline").setup{}
require('bufferline').setup {
  options = {
    mode = "buffers",
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
  }
}



-- LUALINE
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
  },
  theme = "catppuccin"
}




-- NEO TREE
require("neo-tree").setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_diagnostics = true,
  filesystem = {
    window = {
      mappings = {
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["H"] = "toggle_hidden",
        ["/"] = "fuzzy_finder",
        ["f"] = "filter_on_submit",
        ["<c-x>"] = "clear_filter",
      }
    }
  },
})




-- TREESITTER
require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "python", "html", "javascript", "css",
    "php", "lua", "rust", "java" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
  indent = {
    enable = true,
  }
}
--vim.opt.foldmethod = "expr"
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"




-- NVIM-CMP
local cmp = require 'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
      { name = 'buffer' },
    })
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
      { name = 'cmdline' }
    })
})





-- LSPCONFIG
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['sumneko_lua, clangd, pyright, html, quick_lint_js, cssls, intelephense'].setup {
  capabilities = capabilities
}




-- NVIM-LSP-INSTALLER
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  -- fix 'undefined global' on neovim lua files
  if server.name == "sumneko_lua" then
    opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          },
        }
      }
    }
  end
  server:setup(opts)
end)
