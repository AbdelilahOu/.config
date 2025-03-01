local wezterm = require('wezterm')

-- Aura theme color variant hex codes
local colors = {
    -- Default Aura color palette
    default = {
        -- Base colors
        background = '#15141b',
        background_alt = '#1c1b24',
        background_lighter = '#21202e',
        border = '#2d2b40',
        text = '#edecee',
        text_light = '#dcdbdd',
        text_dark = '#837e96',

        -- Syntax colors
        gray = '#545167',
        gray_alt = '#6d6883',
        red = '#e26c7c',
        red_alt = '#ff5370',
        green = '#71f0ae',
        green_alt = '#95e6cb',
        yellow = '#fdf29f',
        yellow_alt = '#ffcc99',
        blue = '#86d0f9',
        blue_alt = '#54c9ff',
        purple = '#ae9ad6',
        purple_alt = '#c597ff',
        cyan = '#98ecf7',
        cyan_alt = '#a4ffff',
        orange = '#f8c275',
        orange_alt = '#ffae57',

        -- UI colors
        selection = '#3a3950',
        cursor = '#a277ff'
    },

    -- Soft variation with slightly lighter backgrounds
    soft = {
        -- Base colors
        background = '#19181f',
        background_alt = '#201f28',
        background_lighter = '#252432',
        border = '#302e44',
        text = '#edecee',
        text_light = '#dcdbdd',
        text_dark = '#837e96',

        -- Syntax colors (same as default)
        gray = '#545167',
        gray_alt = '#6d6883',
        red = '#e26c7c',
        red_alt = '#ff5370',
        green = '#71f0ae',
        green_alt = '#95e6cb',
        yellow = '#fdf29f',
        yellow_alt = '#ffcc99',
        blue = '#86d0f9',
        blue_alt = '#54c9ff',
        purple = '#ae9ad6',
        purple_alt = '#c597ff',
        cyan = '#98ecf7',
        cyan_alt = '#a4ffff',
        orange = '#f8c275',
        orange_alt = '#ffae57',

        -- UI colors
        selection = '#3a3950',
        cursor = '#a277ff'
    }
}

local aura = {}

function aura.select(palette)
    return {
        foreground = colors[palette].text,
        background = colors[palette].background,
        cursor_bg = colors[palette].cursor,
        cursor_border = colors[palette].cursor,
        cursor_fg = colors[palette].background,
        selection_bg = colors[palette].selection,
        selection_fg = colors[palette].text,

        ansi = {
            colors[palette].background_lighter,  -- Black
            colors[palette].red,                 -- Red
            colors[palette].green,               -- Green
            colors[palette].yellow,              -- Yellow
            colors[palette].blue,                -- Blue
            colors[palette].purple,              -- Magenta
            colors[palette].cyan,                -- Cyan
            colors[palette].text_light,          -- White
        },

        brights = {
            colors[palette].gray,                -- Bright Black
            colors[palette].red_alt,             -- Bright Red
            colors[palette].green_alt,           -- Bright Green
            colors[palette].yellow_alt,          -- Bright Yellow
            colors[palette].blue_alt,            -- Bright Blue
            colors[palette].purple_alt,          -- Bright Magenta
            colors[palette].cyan_alt,            -- Bright Cyan
            colors[palette].text,                -- Bright White
        },

        tab_bar = {
            background = colors[palette].background,
            active_tab = {
                bg_color = colors[palette].background_alt,
                fg_color = colors[palette].purple_alt,
            },
            inactive_tab = {
                bg_color = colors[palette].background,
                fg_color = colors[palette].text_dark,
            },
            inactive_tab_hover = {
                bg_color = colors[palette].background_lighter,
                fg_color = colors[palette].text_light,
            },
            new_tab = {
                bg_color = colors[palette].background,
                fg_color = colors[palette].text_dark,
            },
            new_tab_hover = {
                bg_color = colors[palette].background_lighter,
                fg_color = colors[palette].text_light,
                italic = true,
            },
        },

        visual_bell = colors[palette].purple,
        indexed = {
            [16] = colors[palette].orange,
            [17] = colors[palette].orange_alt,
        },
        scrollbar_thumb = colors[palette].border,
        split = colors[palette].border,
        compose_cursor = colors[palette].cyan,
    }
end

function aura.setup(options)
    -- default options
    options = options or {}
    local flavor = options.flavor or 'default'

    return aura.select(flavor)
end

return aura
