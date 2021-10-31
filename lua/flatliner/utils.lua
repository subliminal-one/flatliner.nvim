local M = {}

M.count_matches = function(pattern, line)
  local match = line:match(pattern)

  if match == nil then
    return 0
  else
    return match:len()
  end
end

M.fold_stacked = function(matches)
  if matches == 0 then
    return "="
  else
    return ">1"
  end
end

M.fold_tree = function(matches)
  if matches == 0 then
    return "="
  else
    return ">" .. matches
  end
end

return M
