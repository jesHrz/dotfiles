local scheme = "material"
local colorscheme_cmd = "colorscheme " .. scheme

vim.g.material_style = "lighter"

if not pcall(vim.cmd, colorscheme_cmd) then
  vim.notify(colorscheme_cmd .. " not found")
  return
end

