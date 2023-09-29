local lsp = require("lsp-zero")
local rust_lsp = lsp.build_options('rust_analyzer', {})

local rust_tools = require('rust-tools')
--
local custom_setting = {
  on_attach = function(_, bufnr)
    -- Hover actions
    vim.keymap.set("n", "<leader>ha", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
    -- Code action groups
    vim.keymap.set("n", "<leader>ca", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
  end,
  settings = {
    ['rust-analyzer'] = {
      assist = {
        importMergeBehavior = "last",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true
      },
      check = {
        command = "clippy",
      },
      inlayHints = {
        closingBraceHints = {
          minLines = 100,
        },
        maxLength = 100,
        expressionAdjustmentHints = {
          enable = "always",
        },
        lifetimeElisionHints = {
          enable = "never",
        },
        reborrowHints = {
          enable = "always",
        },
        bindingModeHints = {
          enable = true,
        },
        chainingHints = {
          enable = true,
        },
        typeHints = {
          enable = true,
        },
        parameterHints = {
          enable = true,
        },
        closureReturnTypeHints = {
          enable = "always",
        },
        closureCaptureHints = {
          enable = true,
        },
        discriminatorHints = {
          enable = true,
        },
        renderColons = true,
        displayInlayHints = true,
        enable = true,
      },
    },
  }
}

for k, v in pairs(custom_setting) do
  rust_lsp[k] = v
end

rust_tools.setup({
  tools = {
    autoSetHints = true,
    runnables = {
      use_telescope = true
    },
    inlay_hints = {
      auto = true,
      only_current_line = true,
      show_parameter_hints = true,
    },
  },
  server = rust_lsp,
})
