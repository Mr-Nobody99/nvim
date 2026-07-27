vim.pack.add({ "https://github.com/folke/snacks.nvim.git" })

local cmd
if jit.os == "Windows" then
	cmd = "& " .. vim.fn.stdpath("config") .. "/x86_64-windows-header.exe"
else
	cmd = vim.fn.stdpath("config") .. "/aarch64-macos-header"
end

local Snacks = require("snacks")

Snacks.setup({
  animate = {enabled = true},
  bufdelete = {enabled = true},
  dashboard = {
    enabled = true,
    width = 102,
    sections = {
      {
        cmd = cmd,
        section = "terminal",
        width = 102,
        height = 11,
        padding = 2,
      },
      { section = "keys", gap = 0 },
    }
  },
	explorer = { enabled = true },
  git = {enabled = true},
	indent = { enabled = true },
	input = { enabled = true },
	notifier = { enabled = true },
	picker = {
    enabled = true,
    sources = {
      files = {
        ignored = false,
        hidden = false,
        win = {
          input = {
            keys = {
              ["<S-h>"] = "toggle_hidden",
              ["<S-i>"] = "toggle_ignored",
              ["<S-f>"] = "toggle_follow",
              ["<C-y>"] = {"yazi_copy_relative_path", mode = {"n", "i"}},
            }
          }
        }
      },
      grep = {
        ignored = false,
        hidden = false,
        win = {
          input = {
            keys = {
              ["<S-h>"] = "toggle_hidden",
              ["<S-i>"] = "toggle_ignored",
              ["<S-f>"] = "toggle_follow",
            }
          }
        }
      }
    }
  },
  quickfix = {enabled = true},
	scroll = { enabled = true },
  statuscolumn = {
    enabled = true,
    left = { "mark", "sign", },
    right = {"fold", "git"},
    git = {
      patterns = { "GitSign", "MiniDiffSign" }
    }
  },
  terminal = {
    enabled = true,
    win = {
      style = "terminal",
      border = "rounded",
    }
  },
})

vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end, {desc = "Buffer Delete"})
vim.keymap.set("n", "<leader><leader>", function() Snacks.picker.files() end, { desc = "File Picker" })
vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end, { desc = "Snacks Explorer" })
vim.keymap.set("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })

vim.keymap.set({ "n", "t" }, "<C-\\>", function() Snacks.terminal("zsh") end, { desc = "Floating Terminal" })
vim.keymap.set({ "n", "t" }, "<C-/>", function() Snacks.terminal() end, { desc = "Bottom Terminal" })

vim.keymap.set("n", "<leader>n", function() Snacks.picker.notifications() end, { desc = "Notification History" })

vim.keymap.set("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep open buffers" })
vim.keymap.set("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep" })

vim.keymap.set("n", "<leader>gb", function() Snacks.picker.git_branches() end, {desc = "Git Branches"})
vim.keymap.set("n", "<leader>gd", function() Snacks.picker.git_diff() end, {desc = "Git Diff (Hunks)"})
vim.keymap.set("n", "<leader>gf", function() Snacks.picker.git_log_file() end, {desc = "Git Log File"})
vim.keymap.set("n", "<leader>gl", function() Snacks.picker.git_log_line() end, {desc = "Git Log Line"})
vim.keymap.set("n", "<leader>gL", function() Snacks.picker.git_log() end, {desc = "Git Log"})
vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end, {desc = "Git Status"})
vim.keymap.set("n", "<leader>gS", function() Snacks.picker.git_stash() end, {desc = "Git Stash"})

vim.keymap.set("n", '<leader>s"', function() Snacks.picker.registers() end, { desc = "Registers" })
vim.keymap.set("n", '<leader>s/', function() Snacks.picker.search_history() end, { desc = "Search History" })
vim.keymap.set("n", '<leader>sa', function() Snacks.picker.autocmds() end, { desc = "Auto Commands" })
vim.keymap.set("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" })
vim.keymap.set("n", "<leader>si", function() Snacks.picker.icons() end, { desc = "Icons" })
vim.keymap.set("n", "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" })
vim.keymap.set("n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
vim.keymap.set("n", "<leader>sM", function() Snacks.picker.man() end, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
vim.keymap.set("n", "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo History" })
