local prettier = require("prettier")

prettier.setup({
  bin = 'prettier',
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  -- cli_options = {
  --   -- https://prettier.io/docs/en/cli.html#--config-precedence
  --   config_precedence = "prefer-file", -- or "cli-override" or "file-override"
  -- },
  -- ["null-ls"] = {
  --   condition = function()
  --     return prettier.config_exists({
  --       -- if `false`, skips checking `package.json` for `"prettier"` key
  --       check_package_json = true,
  --     })
  --   end,
  --   runtime_condition = function()
  --     -- return false to skip running prettier
  --     return true
  --   end,
  --   timeout = 5000,
  -- }
})
