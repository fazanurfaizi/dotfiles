local M = {}

M.docker_image = nil
M.python = "python"

function M.set_python_docker()
  vim.api.nvim_create_user_command("SetPythonDocker", function(opts)
    local image = opts.args
    if image == "" then
      vim.notify("Usage :SetPythonDocker <image>", vim.log.levels.ERROR)
    end

    M.docker_image = image
    M.python = { "docker", "exec", "-i", target, "python" }

    vim.notify("Python Docker image set to " .. image, vim.log.levels.INFO)
  end, {
    nargs = 1,
    complete = "shellcmd",
  })
end

return M
