local dap = require('dap')
dap.set_log_level('TRACE')
--dap.adapters.lldb = {
--  type = 'executable',
--  command = '/usr/bin/lldb-vscode-14', -- adjust as needed, must be absolute path
--  name = 'lldb'
--}

--dap.configurations.rust = {
--  {
--    name = 'Launch',
--    type = 'lldb',
--    request = 'launch',
--    program = function()
--      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--    end,
--    cwd = '${workspaceFolder}',
--    stopOnEntry = false,
--    args = {},

--    -- 💀
--    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
--    --
--    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
--    --
--    -- Otherwise you might get the following error:
--    --
--    --    Error on launch: Failed to attach to the target process
--    --
--    -- But you should be aware of the implications:
--    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
--    -- runInTerminal = false,
--    -- ... the previous config goes here ...,
--    initCommands = function()
--      -- Find out where to look for the pretty printer Python module
--      local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))

--      local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
--      local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

--      local commands = {}
--      local file = io.open(commands_file, 'r')
--      if file then
--        for line in file:lines() do
--          table.insert(commands, line)
--        end
--        file:close()
--      end
--      table.insert(commands, 1, script_import)

--      return commands
--    end,
--    -- ...,
--  }
--}

local dapui = require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dapui.setup()

require('dap-go').setup {
  dap_configurations = {
    {
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
      connect = {
        host = "127.0.0.1",
        port = "43000"
      }
    },
  },
  delve = {
    port = "43000"
  },
}
