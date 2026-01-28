-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local group = augroup("update_title", { clear = true })

vim.opt.title = true

-- Update title automatically when switch projects
vim.opt.titlestring = vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " - nvim"

autocmd("DirChanged", {
  group = group,
  callback = function()
    vim.opt.titlestring = vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " — nvim"
  end,
})

-- create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
--   desc = "Recognize .gemrc as yaml",
--   group = "file_types",
--   pattern = { ".gemrc" },
--   command = [[ set filetype=yaml ]],
-- })
--
-- create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
--   desc = "Recognize mdx files as markdown",
--   group = "file_types",
--   pattern = { "*.mdx" },
--   command = [[ set filetype=markdown ]],
-- })
--
-- create_autocmd("FileType", {
--   desc = "Disable autocmd set filetype=eruby.yaml from rails.vim",
--   group = "file_types",
--   pattern = "eruby.yaml",
--   command = [[set filetype=yaml]],
-- })

-- create_autocmd({ "BufRead", "BufNewFile" }, {
--   desc = "Recognize .html as jinja2 if in python project",
--   pattern = {
--     "templates/*.html",
--     "**/templates/*.html",
--     "*.html",
--     "*.jinja",
--     "*.jinja2",
--   },
--   callback = function()
--     local root = util.find_git_ancestor(vim.fn.expand("%:p")) or vim.fn.expand("%:p:h")
--
--     -- Try to find a .venv or venv folder
--     local venv_path = find_venv.find_venv_path(root)
--
--     local python_path = venv_path .. "/bin/python"
--     if vim.fn.executable(python_path) == 1 then
--       -- notify Pyright of config change
--       vim.notify("[Jinja2] All HTML files will treat as jinja2" .. python_path, vim.log.levels.INFO)
--       vim.bo.filetype = "jinja2"
--     else
--       vim.notify("[Jinja2] Found venv but python binary not executable", vim.log.levels.ERROR)
--     end
--   end,
-- })
