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

    -- Clangd setup because it's weird
    require("lspconfig").clangd.setup({})

    require("mason").setup {}
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = {
        'vtsls',
        "rust_analyzer",
        "lua_ls",
        "gopls",
        "tailwindcss",
        "eslint"
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,
        ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border("FloatBorder") }),
        ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help,
          { border = border("FloatBorder") }),
      }
    })

    -- Enable separately to use installed biome version
    vim.lsp.enable("biome")
    vim.lsp.config("biome", {
      cmd = { "bun", "biome", "lsp-proxy" },
    })

    vim.lsp.config('*', {
      capabilities = capabilities,
    })

    vim.lsp.inlay_hint.enable(true)

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

    vim.lsp.config("vtsls", {
      root_markers = {
        ".git",
        "pnpm-workspace.yaml",
        "pnpm-lock.yaml",
        "yarn.lock",
        "package-lock.json",
        "bun.lockb"
      },
      settings = {
        typescript = {
          tsserver = {
            maxTsServerMemory = 8184,
          },
          inlayHints = {
            parameterNames = { enabled = "literals" },
            -- parameterTypes = { enabled = true },
            -- variableTypes = { enabled = true },
            -- propertyDeclarationTypes = { enabled = true },
            -- functionLikeReturnTypes = { enabled = true },
            -- enumMemberValues = { enabled = true },
          }
        }
      }
    })

    local home = os.getenv("HOME")
    vim.lsp.config("clangd", {
      cmd = {
        "clangd",
        "--background-index",
        -- For PlatformIO Projects
        "--query-driver=" .. home .. "/.platformio/packages/toolchain-xtensa*/bin/*g++*"
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


    local autocmd = vim.api.nvim_create_autocmd
    local augroup = vim.api.nvim_create_augroup
    local LspGroup = augroup('LspGroup', {})

    autocmd('LspAttach', {
      group = LspGroup,
      callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition({ border = "rounded" }) end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

        vim.keymap.set("n", "<leader>f", function()
          require("conform").format({
            lsp_format = 'fallback'
          })
        end)
      end
    })
  end,
}
