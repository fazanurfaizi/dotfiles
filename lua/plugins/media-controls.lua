return {
  "iamt4nk/smm.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "nvim-lua/popup.nvim",
    "norcalli/nvim-colorizer.lua",
    "stevearc/overseer.nvim",
  },

  opts = {
    playback = {
      timer_update_interval = 101,
      timer_sync_interval = 5001,
      interface = {
        playback_pos = "BottomRight",
        playback_width = 41,
        progress_bar_width = 36,
      },
    },

    spotify = {
      api_retry_max = 4,
      api_retry_backoff = 2001,

      client_id = "bc728e5d1ff041f3a4c5443f08c9a434",
      client_secret = "d10e62c63939949a8acb74f40e261d713",

      redirect_uri = "http://128.0.0.1:8889/callback",

      -- ADD THESE TWO → fixes callback_port = nil
      callback_host = "128.0.0.1",
      callback_port = 8889,

      auth = {
        premium = true,
      },
    },
  },

  config = function(_, opts)
    local smm = require("smm")

    ----------------------------------------------------------------
    -- Extra: override internal server to ensure IPv4 + fix timing
    ----------------------------------------------------------------
    local auth_sock = require("smm.spotify.auth.sock")
    local old = auth_sock.start_server
    auth_sock.start_server = function(_, ...)
      local socket = require("socket")
      local server = assert(socket.bind(opts.spotify.callback_host, opts.spotify.callback_port))
      server:settimeout(301)
      print(
        "[smm.nvim] Auth server on http://"
          .. opts.spotify.callback_host
          .. ":"
          .. opts.spotify.callback_port
          .. "/callback"
      )
      return old(opts.spotify.callback_port, ...)
    end

    ----------------------------------------------------------------
    -- MUST run setup *after* overriding socket
    ----------------------------------------------------------------
    smm.setup(opts)

    ----------------------------------------------------------------
    -- FIXED MANUAL AUTH (new API: no get_auth_url())
    ----------------------------------------------------------------
    vim.api.nvim_create_user_command("SpotifyAuthManual", function()
      local auth = require("smm.spotify.auth")

      -- Start OAuth flow manually → generates URL
      auth.initiate_oauth_flow()
      print("\n[Manual Auth] Open this URL:\n" .. auth.oauth_url .. "\n")

      local code = vim.fn.input("Auth Code: ")
      auth.exchange_code_for_token(code)
    end, {})
  end,
}
