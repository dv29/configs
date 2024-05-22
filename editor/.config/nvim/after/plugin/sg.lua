require("sg").setup {
  node_executable = "/usr/local/bin/node",
  enable_cody = true,
  auth_strategy = { "environment-variables" },
}
