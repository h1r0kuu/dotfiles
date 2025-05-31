return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit Status" },
    { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Neogit Commit" },
  },
  opts = {
    disable_signs = false,
    disable_hint = false,
    disable_context_highlighting = false,
    disable_commit_confirmation = false,
    auto_refresh = true,
    sort_branches = "-committerdate",
    kind = "tab",
    commit_popup = {
      kind = "split",
    },
    popup = {
      kind = "split",
    },
    integrations = {
      diffview = true,  -- Requires diffview.nvim
      telescope = true, -- Requires telescope.nvim
    },
    sections = {
      untracked = {
        folded = false
      },
      unstaged = {
        folded = false
      },
      staged = {
        folded = false
      },
      stashes = {
        folded = true
      },
      unpulled = {
        folded = true
      },
      unmerged = {
        folded = false
      },
      recent = {
        folded = true
      },
    },
    mappings = {
      status = {
        ["q"] = "Close",
        ["1"] = "Depth1",
        ["2"] = "Depth2",
        ["3"] = "Depth3",
        ["4"] = "Depth4",
        ["<tab>"] = "Toggle",
        ["x"] = "Discard",
        ["s"] = "Stage",
        ["S"] = "StageUnstaged",
        ["<c-s>"] = "StageAll",
        ["u"] = "Unstage",
        ["U"] = "UnstageStaged",
        ["d"] = "DiffAtFile",
        ["$"] = "CommandHistory",
        ["<c-r>"] = "RefreshBuffer",
        ["<enter>"] = "GoToFile",
        ["<space>"] = "Toggle",
        ["?"] = "HelpPopup",
        ["D"] = "DiffPopup",
        ["p"] = "PullPopup",
        ["r"] = "RebasePopup",
        ["P"] = "PushPopup",
        ["c"] = "CommitPopup",
        ["L"] = "LogPopup",
        ["Z"] = "StashPopup",
        ["b"] = "BranchPopup",
      }
    }
  },
  config = function(_, opts)
    require("neogit").setup(opts)
  end
}