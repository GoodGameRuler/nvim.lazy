return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
        hide_during_completion = true,
        keymap = {
          accept = "<Right>",
        }
      },
      filetypes = {
        ["*"] = false,
        javascript = true,
        go = true,
        golang = true,
        python = true,
        sh = true,
        yaml = true,
        markdown = true,
        gitcommit = true,
        gitconfig = true,
        sql = true,
      },
      copilot_node_command = "node", -- Node.js version must be > 18.x
      server_opts_overrides = {},
    })
  end,
}
