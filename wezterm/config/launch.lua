local wezterm = require('wezterm')
local platform = require('utils.platform')()

local options = {
    default_prog = {},
    launch_menu = {},
}

if platform.is_win then
    options.default_prog = { "powershell" }
    options.launch_menu = {
        { label = " PowerShell Core", args = { "pwsh" } },
        { label = " PowerShell Desktop", args = { "powershell" } },
        { label = " CMD", args = { "cmd" } },
    }
elseif platform.is_linux then
    options.default_prog = { "zsh", "-l" }
    options.launch_menu = {
        { label = 'Zsh', args = { 'zsh', '-l' } },
        { label = 'Bash', args = { 'bash', '-l' } },
    }
end

return options