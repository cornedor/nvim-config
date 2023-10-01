local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }


    vim.keymap.set('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<leader>lf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  end
})

local default_setup = function(server)
  lspconfig[server].setup({})
end

-- Languages
lspconfig.rescriptls.setup({
  cmd = {
    "node",
    packer_plugins["vim-rescript"].path .. "/server/out/server.js",
    "--stdio"
  },
})
lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})
lspconfig.elixirls.setup({
  cmd = { "/Users/corne/.local/share/elixir-ls/language_server.sh" }
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = { default_setup },
})

-- CMP

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
});

require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT"
      },
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        }
      }
    }
  }
})

-- require('lsp_signature').setup()

local whichKey = require('which-key')
whichKey.register({
  g = {
    h = { '<cmd>lua vim.lsp.buf.hover()<cr>', "Hover" },
    d = { '<cmd>lua vim.lsp.buf.definition()<cr>', "Goto: Definition" },
    D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', "Goto: Declaratin" },
    i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', "Goto: Implementation" },
    o = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', "Goto: Type definition" },
    r = { '<cmd>lua vim.lsp.buf.references()<cr>' },
    s = { '<cmd>lua vim.lsp.buf.signature_help()<cr>' },
    l = { '<cmd>lua vim.diagnostic.open_float()<cr>' },
  },
})

whichKey.register({
  l = {
    r = { '<cmd>lua vim.lsp.buf.rename()<cr>', "Rename" },
    f = { '<cmd>lua vim.lsp.buf.format({async = true})<cr>', "Format" },
    c = { '<cmd>lua vim.lsp.buf.code_action()<cr>', "Code action" },
  }
}, {
  prefix = "<leader>",
})

