local function get_debugpy_path()
  local venv = os.getenv("VIRTUAL_ENV")
  if venv then
    return venv .. "/bin/python"
  end

  local cwd = vim.fn.getcwd()
  local uv_venv = cwd .. "/.venv/bin/python"
  if vim.fn.filereadable(uv_venv) == 1 then
    return uv_venv
  end

  local venv_path = cwd .. "/venv/bin/python"
  if vim.fn.filereadable(venv_path) == 1 then
    return venv_path
  end

  -- Fallback to mason
  return vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
end

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      require("dap-python").setup(get_debugpy_path())

      local dap = require("dap")
      vim.keymap.set("n", "<F5>", dap.continue)
      vim.keymap.set("n", "<F10>", dap.step_over)
      vim.keymap.set("n", "<F11>", dap.step_into)
      vim.keymap.set("n", "<F12>", dap.step_out)
    end,
  },
}
