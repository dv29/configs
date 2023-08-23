local lsp = require("lsp-zero")
local rust_lsp = lsp.build_options('rust_analyzer', {})

-- require("lsp-inlayhints").setup()

local rust_tools = require('rust-tools')
-- local inlay_hints = require("inlay-hints")
-- inlay_hints.setup()

rust_tools.setup({
  tools = {
    -- on_initialized = function()
    --   inlay_hints.set_all()
    -- end,
    inlay_hints = {
      auto = true,
      only_current_line = true,
      show_parameter_hints = true,
      -- parameter_hints_prefix = "<- ",
      -- other_hints_prefix = "=> ",
      -- max_len_align = false,
      -- max_len_align_padding = 1,
      -- right_align = false,
      -- right_align_padding = 7,
      -- highlight = "Comment",
    },
  },
  -- server = rust_lsp,
  server = {
    -- on_attach = lsp.on_attach_buffer,
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<leader>ha", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<leader>ca", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
    end,
    ['rust-analyzer'] = {
      cargo = {
        checkOnSave = {
          command = "clippy",
        },
      },
      inlayHints = {
        closingBraceHints = {
          minLines = 10,
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
        maxStringLength = 25,
        renderColons = true,
      displayInlayHints = true,
      enable = true,
      },
    },
  }
})
