require('onedarkpro').setup({
  colors = {
    onedark = { bg = "#141414" },
    green = "#C3E88D",
    red = "#f07178",
    purple = "#C792EA",
    blue = "#82AAFF",
    cyan = "#89DDFF",
    orange = "#FFCB6B",
  },
  highlights = {
    Comment = { fg = "#546E7A", italic = true },
    Include = { fg = "${cyan}" },

    ["@property"] = { fg = "${red}" },
    ["@variable.builtin"] = { fg = "${red}" },
    ["@lsp.typemod.property.declaration.typescript"] = { fg = "#B2CCD6" },
    ["@lsp.typemod.property.declaration.typescriptreact"] = { fg = "#B2CCD6" },
    ["@lsp.typemod.parameter.declaration.typescriptreact"] = { fg = "#F78C6C" },
    -- ["@type.builtin.tsx"] = { fg = "#B2CCD6" },
    ["@constant"] = {},
    ["@conditional"] = { fg = "${cyan}" },
    ["@operator"] = { fg = "${purple}" },
    ["@none"] = { fg = "${cyan}" },

    ["@lsp.mod.readonly.typescript"] = {},
    ["@tag.attribute.tsx"] = { fg = "${purple}" },
    ["@keyword.coroutine.typescript"] = { fg = "${cyan}" },
    ["@keyword.return.typescript"] = { fg = "${cyan}" },

    Boolean = { fg = "#F78C6C" },
    Delimiter = { fg = "${cyan}" },
  }
})
