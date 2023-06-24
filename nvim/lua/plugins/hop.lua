local M = {}
	local status, hop = pcall(require, "hop")
    if not status then
        return
    end

function M.config()
    -- place this in one of your configuration file(s)
local hop = require('hop')
hop.setup { keys = 'etovxqpdygfblzhckisuran' }
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'ss', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR})
end, {remap=true})
vim.keymap.set('', 'sS', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR})
end, {remap=true})
end
return M
