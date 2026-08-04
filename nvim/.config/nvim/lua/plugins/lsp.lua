-- Proper venv detection for uv, venv, poetry, etc
local function get_python_path()
  local venv = os.getenv("VIRTUAL_ENV")
  if venv then
    return venv .. "/bin/python"
  end

  -- Check for uv venv in project root (.venv)
  local cwd = vim.fn.getcwd()
  local uv_venv = cwd .. "/.venv/bin/python"
  if vim.fn.filereadable(uv_venv) == 1 then
    return uv_venv
  end

  -- Check for venv in project root
  local venv_path = cwd .. "/venv/bin/python"
  if vim.fn.filereadable(venv_path) == 1 then
    return venv_path
  end

  -- Fallback
  return "python3"
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Global LSP settings to prevent hangs
      servers = {
        pyright = {
          settings = {
            python = {
              pythonPath = get_python_path(),
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                -- Prevent pyright from analyzing too much
                extraPaths = {},
                ignore = { "*" }, -- ignore everything except what's explicitly included
              },
            },
          },
          -- Timeout settings to prevent lockup
          on_init = function(client, _)
            -- Force single-threaded analysis to avoid lock issues
            client.config.settings.python.analysis.workers = 1
          end,
        },
      },
      -- Global timeout for all LSP operations
      handlers = {
        ["$/progress"] = function()
          -- Silence progress notifications which can spam
        end,
      },
    },
  },
}
