local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
    "onsails/lspkind.nvim"
  },

  config = function()
    require("fidget").setup {}

    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force", {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )


    require("mason").setup {}
    require("mason-lspconfig").setup({
      ensure_installed = {
        'ts_ls',
        "rust_analyzer",
        "lua_ls",
        "gopls",
        "tailwindcss",
        "biome",
        "eslint"
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,
        ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border("FloatBorder") }),
        ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border("FloatBorder") }),
      }
    })


    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = {
              "vim", "require"
            },
          },
          format = {
            enable = true,
            defaultConfig = {
              indent_style = "space",
              indent_size = 2,
            }
          }

        }
      }
    })

    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      window = {
        completion = {
          border = border("CmpBorder"),
          winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None"
        },
        documentation = {
          border = border("CmpDocBorder")
        }
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      sources = cmp.config.sources({
        { name = 'copilot', group_index = 2 },
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        name = "buffer",
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          menu = {
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[Latex]",
          },
        })
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
    })

    vim.diagnostic.config({
      virtual_text = true,
      float = {
        focusable = false,
        style = "minimal",
        border = border("FloatBorder"),
        source = "always",
        header = "",
        prefix = ""
      }
    })
  end,
}
