local lualine_require = require('lualine_require')
local M = lualine_require.require('lualine.component'):extend()

local default_options = {
  icon = '󰬈',
  prefix = '0x',
  placeholder = '∅',
}

function M:init(options)
  M.super.init(self, options)
  self.options = vim.tbl_deep_extend('keep', self.options or {}, default_options)
end

local function get_char_under_cursor()
  local line = vim.api.nvim_get_current_line()
  local col = vim.fn.col('.')
  return vim.fn.strcharpart(line:sub(col), 0, 1)
end

function M:update_status()
  local text = get_char_under_cursor()

  if #text == 0 then
    return self.options.placeholder
  end

  local hex = self.options.prefix

  for i = 1, #text do
    hex = hex .. string.format('%x', text:byte(i))
  end

  return hex
end

return M
