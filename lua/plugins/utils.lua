return {
  { "wakatime/vim-wakatime", lazy = false },
  {
    "IogaMaster/neocord",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      logo = "auto",
      logo_tooltip = "vscode killers!",
      main_image = "logo",
      log_level = nil,
      debounce_timeout = 10,
      blacklist = {},
      file_assets = {},
      show_time = false,
      global_timer = false,
      editing_text = "Editing %s",
      file_explorer_text = "Browsing %s",
      git_commit_text = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text = "Reading %s",
      workspace_text = "Working on %s",
      line_number_text = "Line %s out of %s",
      terminal_text = "Using Terminal",
    },
  },
}
