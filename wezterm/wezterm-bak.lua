-- Wezterm configuration
-- powered by aquawius
-- this is version 6
-- version 1: initial config
-- version 2: wsl support
-- version 3: update theme to purple style
-- version 4: fix bug "git log" with "terminal is not fully functional"
--            tracert: term set to "" is not a compatible term for git
-- version 5: update theme to dracula official.
-- version 6: add feature: open hyperlinks on pressing ctrl key and mouse_left key.

local wezterm = require("wezterm");
local dracula = require('dracula');

local config = {
    check_for_updates = false,
    -- Here are wezterm default color scheme, which is good.
    -- color_scheme = "Fahrenheit",
    -- color_scheme = "Gruvbox Dark",
    -- color_scheme = "Blue Matrix",
    -- color_scheme = "Pandora",
    -- color_scheme = "Grape",
    -- color_scheme = "Firewatch",
    -- color_scheme = "Duotone Dark",
    -- color_scheme = "Sakura",
    -- color_scheme = "lovelace",

    enable_scroll_bar = true,
    exit_behavior = "Close",

    inactive_pane_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.0,
    },

    -- font = wezterm.font(''),
    -- font = wezterm.font_with_fallback({"CaskaydiaCove Nerd Font", "Cascadia Code", "Fira Code"}),

    -- default_cwd = "/some/path",
    launch_menu = {},

    -- if you want to use leader key, you should set operations on trig.
    -- leader = { key = "b", mods = "CTRL" },
    set_environment_variables = {},

    -- set default theme to dracula official conf
    colors = dracula,
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,

    -- enable feature on open hyperlinks on press ctrl key
    mouse_bindings = { -- Change the default click behavior so that it only selects
    -- text and doesn't open hyperlinks
    {
        event = {
            Up = {
                streak = 1,
                button = "Left"
            }
        },
        mods = "NONE",
        action = wezterm.action.CompleteSelection("PrimarySelection")
    }, -- and make CTRL-Click open hyperlinks
    {
        event = {
            Up = {
                streak = 1,
                button = "Left"
            }
        },
        mods = "CTRL",
        action = wezterm.action.OpenLinkAtMouseCursor
    }, -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
    {
        event = {
            Down = {
                streak = 1,
                button = 'Left'
            }
        },
        mods = 'CTRL',
        action = wezterm.action.Nop
    }}
}

    -- config.term = "" -- Set to empty so FZF works on windows
    -- config.term = "xterm"  -- fix bug in command "git log" with "terminal is not fully functional" or delete this term = "xxxx" (using default term value)

    table.insert(config.launch_menu, {
        label = "Command Prompt",
        args = {"cmd.exe"}
    })
    table.insert(config.launch_menu, {
        label = "PowerShell 5",
        args = {"powershell.exe", "-NoLogo"}
    })
    table.insert(config.launch_menu, {
        label = "PowerShell 7",
        args = {"pwsh.exe", "-NoLogo"}
    })

    table.insert(config.launch_menu, {
        label = "Default WSL Command Prompt",
        args = {"wsl"}
    })

    -- table.insert(config.launch_menu, {
    --     label = "VS PowerShell 2022",
    --     args = {"powershell", "-NoLogo", "-NoExit", "-Command", "devps 17.0"}
    -- })
    -- table.insert(config.launch_menu, {
    --     label = "VS PowerShell 2019",
    --     args = {"powershell", "-NoLogo", "-NoExit", "-Command", "devps 16.0"}
    -- })
    -- table.insert(config.launch_menu, {
    --     label = "VS Command Prompt 2022",
    --     args = {"powershell", "-NoLogo", "-NoExit", "-Command", "devcmd 17.0"}
    -- })
    -- table.insert(config.launch_menu, {
    --     label = "VS Command Prompt 2019",
    --     args = {"powershell", "-NoLogo", "-NoExit", "-Command", "devcmd 16.0"}
    -- })

    -- Enumerate any WSL distributions that are installed and add those to the menu
    local success, wsl_list, wsl_err = wezterm.run_child_process({"wsl", "-l"})
    -- `wsl.exe -l` has a bug where it always outputs utf16:
    -- https://github.com/microsoft/WSL/issues/4607
    -- So we get to convert it
    wsl_list = wezterm.utf16_to_utf8(wsl_list)

    for idx, line in ipairs(wezterm.split_by_newlines(wsl_list)) do
        -- Skip the first line of output; it's just a header
        if idx > 1 then
            -- Remove the "(Default)" marker from the default line to arrive at the distribution name on its own

            -- For English Users, the default line:
            -- local distro = line:gsub(" %(Default%)", "")
            -- For Chinese User,
            local distro = line:gsub(" %(默认%)", "")

            -- Add an entry that will spawn into the distro with the default shell
            table.insert(config.launch_menu, {
                label = distro .. " (WSL default shell)",
                args = {"wsl", "--distribution", distro}
            })

            -- Here's how to jump directly into some other program; in this example
            -- its a shell that probably isn't the default, but it could also be
            -- any other program that you want to run in that environment
            -- table.insert(config.launch_menu, {
            --     label = distro .. " (WSL zsh login shell)",
            --     args = { "wsl", "--distribution", distro, "--exec", "/bin/zsh", "-l" },
            -- })
        end
    end

-- get the current run programs for display on tab bar
-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
function Basename(s)
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane
    local title = Basename(pane.foreground_process_name)
    return {{
        Text = " " .. title .. " "
    }}
end)

return config
