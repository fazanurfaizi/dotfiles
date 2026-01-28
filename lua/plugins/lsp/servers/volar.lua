-- -- Forward Volar TS requests to tsserver
-- local function setup_volar_forwarding(client)
--   local max_wait = 10
--   local wait_count = 0
--
--   -- Helper: Get active tsserver client
--   local function get_ts_client(bufnr)
--     return vim.lsp.get_clients({
--       bufnr = bufnr,
--       name = "ts_ls",
--     })[1]
--   end
--
--   -- Intercept incoming tsserver requests from Volar
--   client.handlers["tsserver/request"] = function(_, result, ctx)
--     local bufnr = ctx.bufnr
--
--     local ts_client = get_ts_client(bufnr)
--     if not ts_client then
--       if wait_count < max_wait then
--         wait_count = wait_count + 1
--         return vim.defer_fn(function()
--           client.handlers["tsserver/request"](_, result, ctx)
--         end, 150)
--       else
--         vim.notify("[Volar] Failed to connect to ts_ls after retries.", vim.log.levels.WARN)
--       end
--       return
--     end
--
--     local id = result[1]
--     local command = result[2]
--     local payload = result[3]
--
--     ts_client:exec_cmd({
--       command = "typescript.tsserverRequest",
--       title = "Forwarded from Volar",
--       arguments = { command, payload },
--     }, { bufnr = bufnr }, function(_, response)
--       client:notify("tsserver/response", { { id, response and response.body } })
--     end)
--   end
-- end
--
-- return {
--   -- Volar hybrid mode = Volar handles Vue logic, tsserver handles TS logic
--   init_options = {
--     vue = {
--       hybridMode = true,
--     },
--   },
--
--   -- Attach forwarding hook
--   on_init = setup_volar_forwarding,
-- }
local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

return {
  root_dir = lspconfig.util.root_pattern("package.json", "vue.config.js", "nuxt.config.js"),

  capabilities = capabilities,

  init_options = {
    vue = {
      hybridMode = true, -- Enable Hybrid Mode
    },
  },
}
