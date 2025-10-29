require("config.options")
require("config.commands")
require("config.mappings")
require("config.filetypes")

require("vim._extui").enable({}) -- https://github.com/neovim/neovim/pull/27855

require("plugins.treesitter")
require("plugins.blink")
require("plugins.lsp")
require("plugins.conform")
require("plugins.fterm")
require("plugins.grugfar")
require("plugins.mini")
require("plugins.oklchcolorpicker")
require("plugins.logsitter")
require("plugins.tsautotag")
require("plugins.ufo")
-- require("plugins.visualmulti")
require("plugins.whichkey")

require("colors.onedark")
