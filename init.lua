-- ----- REQUIREMENTS -----
--  a nerd font, enabled in terminal or whatever
--  packer:           yay -S nvim-packer-git
--  xclip:            yay -S xclip
--  git, curl or wget, unzip, tar, gzip, npm 
--  install npm via nvm: https://github.com/nvm-sh/nvm
--  ----> nvm install node:Neotree right toggle


require('keybindings')
require('packages')
require('config')




-- Cattpuccin
local catppuccin = require("catppuccin")
catppuccin.setup{
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
    },
    telescope = false,
    neotree = {
      enabled = false,
      show_root = true,
      transparent_panel = false,
    },
  }
}
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.cmd[[colorscheme catppuccin]]




-- ONE DARK
require('onedark').setup {
  -- Options: dark, darker, cool, deep, warm, warmer, light
  style = 'darker'
}
--require('onedark').load()




-- WEB-DEVICONS
require'nvim-web-devicons'.setup{}



-- BARBAR
require("bufferline").setup{
  auto_hide = true,
  tabpages = false
}



-- LUALINE
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
  },
}



-- NEO-TREE
require("neo-tree").setup{}



-- TELESCOPE
require('telescope').setup{}




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
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
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




-- NVIM-LSP-INSTALLER
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.setup{
  automatic_installation = true
}




-- LSPCONFIG
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require("lspconfig")
lspconfig.util.default_config = vim.tbl_extend(
  "force",
  lspconfig.util.default_config,
  {
    on_attach = on_attach
  }
)
for _, server in ipairs(lsp_installer.get_installed_servers()) do
  if (server.name == "sumneko_lua") then
    lspconfig["sumneko_lua"].setup{
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          }
        }
      }
    }

  else
    lspconfig[server.name].setup {
      capabilities = capabilities;
    }
  end
end
