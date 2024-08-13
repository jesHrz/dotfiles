
local wezterm = require('wezterm')

local Config = {}

function Config:new()
    local o = {}
    self = setmetatable(o, { __index = Config })
    self.options = {}
    return o
end

function Config:append(new_options)
    for k, v in pairs(new_options) do
        if self.options[k] ~= nil then
            wezterm.log_warn(
                'Duplicate config option: ',
                { old = self.options[k], new = new_options[k] }
            )
        else
            self.options[k] = v
        end
    end
    return self
end

return Config:new()
    :append(require("config.appearance"))
    :append(require("config.bindings"))
    :append(require("config.domains"))
    :append(require("config.general"))
    :append(require("config.launch"))
    .options