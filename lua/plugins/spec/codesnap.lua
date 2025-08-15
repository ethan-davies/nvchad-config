---@type NvPluginSpec
return {
  "mistricky/codesnap.nvim",
  cmd = { "CodeSnap", "CodeSnapSave" },
  init = function()
    local map = vim.keymap.set
    map("x", "<leader>cc", "<cmd>CodeSnap<CR>", { desc = "Save selected code snapshot into clipboard" })
    map("x", "<leader>cs", "<cmd>CodeSnapSave<CR>", { desc = "Save selected code snapshot in ~/Pictures" })
  end,
  opts = function()
    local pictures_path = vim.fn.expand("~/Pictures")
    -- Ensure the directory exists
    if vim.fn.isdirectory(pictures_path) == 0 then
      vim.fn.mkdir(pictures_path, "p")
    end
    
    return {
      save_path = pictures_path,
      code_font_family = "JetBrainsMono Nerd Font",
      has_breadcrumbs = true,
      bg_theme = "grape",
      watermark = "",
    }
  end,
  build = "make",
}
