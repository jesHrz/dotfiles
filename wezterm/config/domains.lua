local wsl_domains = {
    {
        name = "WSL:archlinux",
        distribution = "archlinux",
        username = "nohrzzz",
    }
}

return {
    -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
    ssh_domains = {},

    -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
    unix_domains = {},

    -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
    wsl_domains = wsl_domains,
}