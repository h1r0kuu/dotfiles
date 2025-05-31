return {
  "nvim-telescope/telescope.nvim",
  optional = true,
  opts = function(_, opts)
    if not LazyVim.has("flash.nvim") then
      return
    end

    local function flash(prompt_bufnr)
      require("flash").jump({
        pattern = "^",
        label = { after = { 0, 0 } },
        search = {
          mode = "search",
          exclude = {
            function(win)
              return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
            end,
          },
        },
        action = function(match)
          local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
          picker:set_selection(match.pos[1] - 1)
        end,
      })
    end

    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      mappings = { n = { s = flash }, i = { ["<c-s>"] = flash } },
      -- Add these defaults to always use rg
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!**/.git/*",
      },
    })

    -- Override pickers to use different finder
    opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
      find_files = {
        find_command = {
          "rg",
          "--files",
          "--hidden",
          "--glob=!**/.git/*",
          "--glob=!**/.DS_Store",
          "--glob=!**/node_modules/*",
        },
      },
      live_grep = {
        additional_args = function()
          return { "--hidden", "--glob=!**/.git/*" }
        end,
      },
    })
  end,
}