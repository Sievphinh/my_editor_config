local colorscheme = "gruvbox"

local status_ok = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  -- will add notification when colorscheme not found
  return
end 
