return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },

    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          wrap_results = true,
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 0,

          mappings = {
            n = {},
          },
        },

        pickers = {
          diagnostics = {
            theme = "ivy",
            initial_mode = "normal",
            layout_config = {
              preview_cutoff = 9999,
            },
          },
        },

        extensions = {
          file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
            mappings = {
              ["n"] = {
                ["N"] = fb_actions.create,
                ["h"] = fb_actions.goto_parent_dir,
                ["/"] = function()
                  vim.cmd("startinsert")
                end,

                ["<C-u>"] = function(prompt_bufnr)
                  for _ = 1, 10 do
                    actions.move_selection_previous(prompt_bufnr)
                  end
                end,

                ["<C-d>"] = function(prompt_bufnr)
                  for _ = 1, 10 do
                    actions.move_selection_next(prompt_bufnr)
                  end
                end,

                ["<PageUp>"] = actions.preview_scrolling_up,
                ["<PageDown>"] = actions.preview_scrolling_down,
              },
            },
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")

      -- Keymaps
      vim.keymap.set("n", "<leader>fp", function()
        builtin.find_files({
          cwd = require("lazy.core.config").options.root,
        })
      end, { desc = "Find Plugin File" })

      vim.keymap.set("n", "<leader>fP", function()
        builtin.find_files({
          no_ignore = false,
          hidden = true,
        })
      end, { desc = "List files respecting .gitignore" })

      vim.keymap.set("n", ";r", function()
        builtin.live_grep({
          additional_args = { "--hidden" },
        })
      end, { desc = "Live grep (hidden included)" })

      vim.keymap.set("n", "\\\\", function()
        builtin.buffers()
      end, { desc = "List open buffers" })

      vim.keymap.set("n", ";t", function()
        builtin.help_tags()
      end, { desc = "Help tags" })

      vim.keymap.set("n", ";;", function()
        builtin.resume()
      end, { desc = "Resume last Telescope" })

      vim.keymap.set("n", ";e", function()
        builtin.diagnostics()
      end, { desc = "Diagnostics" })

      vim.keymap.set("n", ";s", function()
        builtin.treesitter()
      end, { desc = "Treesitter symbols" })

      vim.keymap.set("n", "<leader>sf", function()
        local cwd = vim.fn.expand("%:p:h")
        telescope.extensions.file_browser.file_browser({
          cwd = cwd,
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 40 },
        })
      end, { desc = "File browser (current dir)" })
    end,
  },
}
