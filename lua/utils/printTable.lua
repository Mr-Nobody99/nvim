local function printTable(tbl, str)
  for k, v in pairs(tbl) do
    local kStr = "['" .. tostring(k) .. "']"
    local vStr = '"' .. tostring(v) .. '"'
    if type(k) ~= "string" then
      kStr = "[" .. k .. "]"
    end
    if type(v) == "table" then
      printTable(v, (str or "") .. kStr)
    else
      if type(v) ~= "string" then
        vStr = tostring(v)
      end
      print(type(tbl) .. (str or "") .. kStr .. " = " .. vStr)
    end
  end
end

return printTable
