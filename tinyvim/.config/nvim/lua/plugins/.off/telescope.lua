return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzy-native.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_config = {
          horizontal = { prompt_position = "top", results_width = 0.6 },
          vertical = { mirror = false },
        },
        sorting_strategy = "ascending",
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      },
      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        },
      },
    })
    require("telescope").load_extension("fzy_native")
    require("telescope").load_extension("file_browser")
  end,
}
