-- Utility Class for Shared Constants and Functions
local utils = {}

-- Patterns used for step configurations
utils.patterns = {
    { 1 }, { 1, 0, 1 }, { 1, 0, 1, 0 }, { 1, 1, 0, 1 }, { 1, 1, 1, 0 },
    { 1, 1, 0, 0, 1 }, { 1, 1, 0, 1, 0 }, { 1, 1, 0, 1, 0, 0 }, { 1, 1, 0, 1, 0, 1 },
    { 1, 1, 0, 1, 0, 1, 0 }, { 1, 0, 1, 0, 0, 1, 1 }, { 1, 1, 1, 1, 0, 1, 0, 1 },
    { 1, 0, 1, 1, 0, 1, 0, 1 }, { 1, 1, 0, 0, 1, 1, 0, 1 }, { 1, 1, 1, 0, 1, 0, 1, 1 },
    { 1, 0, 0, 1, 1, 0, 1, 0 }, { 1, 1, 0, 1, 1, 1, 0, 1 }, { 1, 0, 1, 1, 0, 1, 1, 0 },
    { 1, 1, 0, 0, 1, 0, 1, 0 }, { 1, 1, 0, 1, 1, 0, 1, 1 }, { 1, 1, 1, 0, 0, 1, 0, 1 },
    { 1, 0, 0, 1, 1, 1, 0, 1 }, { 1, 0, 0, 1, 1, 0, 1, 1 }, { 1, 1, 1, 1, 0, 1, 1, 0 },
    { 1, 0, 0, 0, 0, 1, 1, 0 }, { 1, 0, 1, 0, 0, 1, 1, 0, 1 }, { 1, 0, 1, 0, 1, 1, 1, 0, 1 },
    { 1, 0, 0, 1, 0, 1, 0, 1, 1 }, { 1, 1, 0, 1, 0, 1, 0, 1, 1 }, { 1, 1, 0, 1, 0, 1, 1, 0, 1 },
    { 1, 0, 1, 1, 1, 0, 1, 0, 0, 0 }, { 1, 0, 1, 1, 0, 1, 0, 1, 0, 1 },
    { 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0 }, { 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1 },
    { 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0 }, { 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 }
}

-- Division factors for timing
utils.division_factors = {
    [1] = 1, [2] = 1 / 2, [3] = 1 / 4, [4] = 1 / 8, [5] = 1 / 16, [6] = 1 / 32
}

-- Utilsity function for parameter clamping
function utils.clamp(value, min, max)
    return math.max(min, math.min(max, value))
end

-- Utilsity function for parameter handling with linear and exponential scaling
function utils.handle_param_change(param_name, delta, min_val, max_val, step, scale_type)
    local current_value = params:get(param_name)
    local new_value

    if scale_type == "exp" then
        new_value = utils.clamp(current_value * math.exp(delta * step), min_val, max_val)
    else
        new_value = utils.clamp(current_value + delta * step, min_val, max_val)
    end

    params:set(param_name, new_value)
end

return utils
