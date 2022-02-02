local vim = vim

local cmp = require('cmp')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local nvim_lsp = require('lspconfig')
local lspkind = require "lspkind"

local on_attach  = function(client, bufnr)
    local function buf_nmap(key, result)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', key, result, {noremap = true, silent=true})
    end
    buf_nmap('gd', ':lua vim.lsp.buf.definition()<cr>')
    buf_nmap('gD', ':lua vim.lsp.buf.declaration()<cr>')
    -- buf_nmap('gi', ':lua vim.lsp.buf.implementation()<cr>')
    buf_nmap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
    buf_nmap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
    -- buf_nmap('gr', ':lua vim.lsp.buf.references()<cr>')
    buf_nmap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
    buf_nmap('ge', ':lua vim.diagnostic.open_float(nil, {focus=false})<cr>')
    buf_nmap('gn', ':lua vim.diagnostic.goto_next()<cr>')
    buf_nmap('gp', ':lua vim.diagnostic.goto_prev()<cr>')
    buf_nmap('K', ':lua vim.lsp.buf.hover()<cr>')
    buf_nmap('<c-i>', ':lua vim.lsp.buf.signature_help()<cr>')
    -- buf_nmap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
    buf_nmap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
    buf_nmap('<leader><leader>f', ':lua vim.lsp.buf.formatting_sync()<cr>')

    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.document_range_formatting = true
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use a loop t conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'sumneko_lua', 'jsonls', 'clangd', 'elmls', 'zls' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150, -- ms, send changes to the server
        }
    }
end


vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = false,
  severity_sort = true,
})
vim.o.updatetime = 250
-- disable auto hover; it's very distracting
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Only add for langs that don't support it automatically
vim.cmd([[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync()]])

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, _ in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  -- DISCARD icons(text), numhl is enough
  vim.fn.sign_define(hl, { text = nil, texthl = hl, numhl = hl })
end

lspkind.init {
  with_text = true,
  preset = 'default',
  default = {
    Text = "",
    String = "𝓐",
    Method = "ƒ",
    Function = "ƒ",
    Boolean = "⊨",
    Array = "",
    Type = "𝙏",
    TypeParameter = "𝙏",
    Number = "#",
    Constructor = "",
    Variable = "",
    Class = "𝓒",
    Object = "ﴯ",
    Record = "{}",
    Interface = "",
    Module = "",
    Namespace = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "ℰ",
    Event = "",
    Operator = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "𝓢",
  },
}

-- Autocompletion
cmp.setup({
  enable = function() -- only enable if not in commit
    if require"cmp.config.context".in_treesitter_capture("comment")==true or require"cmp.config.context".in_syntax_group("Comment") then
      return false
    else
      return true
    end
  end,
  mapping = {
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = "treesitter" },
    { name = "vsnip" },
  }),

  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  formatting = {
    format = function(_, vim_item)
      vim_item.kind = string.format("%s", lspkind.presets.default[vim_item.kind])
      return vim_item
    end,
  },
  experimental = {
    ghost_text = true,
  },
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
  { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
