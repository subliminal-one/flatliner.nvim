local utils = require('flatliner.utils')
local M = {}

local config = {
  filetypes = {}
}

M.setup = function(opts)
  opts = opts or {}

  if opts.filetypes ~= nil then
    config.filetypes = opts.filetypes
  end
end

M.fold = function(lnum)
  if config.filetypes[vim.bo.filetype] == nil then
    print('Unconfigured filetype called!')
    return
  end

  local line = vim.fn.getline(lnum)
  local fconfig = config.filetypes[vim.bo.filetype]
  local matches = utils.count_matches(fconfig.pattern, line)

  if fconfig.style == "stacked" then
    return utils.fold_stacked(matches)
  end

  if fconfig.style == nil or fconfig.style == "default" then
    return utils.fold_tree(matches)
  end
end

return M
