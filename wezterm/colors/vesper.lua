local wezterm = require('wezterm')

-- Vesper theme color variant hex codes
local colors = {
    -- Default Vesper color palette
    default = {
        -- Base colors
        background = '#101010',
        background_alt = '#161616',
        background_lighter = '#1C1C1C',
        border = '#282828',
        text = '#FFFFFF',
        text_light = '#FFFFFF',
        text_dark = '#A0A0A0',

        -- Syntax colors
        gray = '#8B8B8B',
        gray_alt = '#A0A0A0',
        red = '#FF8080',
        red_alt = '#FF8080',
        green = '#99FFE4',
        green_alt = '#99FFE4',
        yellow = '#FFC799',
        yellow_alt = '#FFCFA8',
        blue = '#FFFFFF',
        blue_alt = '#FFFFFF',
        purple = '#FFC799',
        purple_alt = '#FFCFA8',
        cyan = '#99FFE4',
        cyan_alt = '#99FFE4',
        orange = '#FFC799',
        orange_alt = '#FFCFA8',

        -- UI colors
        selection = '#FFFFFF',
        cursor = '#FFC799'
    },

    -- Dark variation with deeper blacks
    dark = {
        -- Base colors
        background = '#080808',
        background_alt = '#101010',
        background_lighter = '#161616',
        border = '#232323',
        text = '#FFFFFF',
        text_light = '#FFFFFF',
        text_dark = '#A0A0A0',

        -- Syntax colors (same as default)
        gray = '#8B8B8B',
        gray_alt = '#A0A0A0',
        red = '#FF8080',
        red_alt = '#FF8080',
        green = '#99FFE4',
        green_alt = '#99FFE4',
        yellow = '#FFC799',
        yellow_alt = '#FFCFA8',
        blue = '#FFFFFF',
        blue_alt = '#FFFFFF',
        purple = '#FFC799',
        purple_alt = '#FFCFA8',
        cyan = '#99FFE4',
        cyan_alt = '#99FFE4',
        orange = '#FFC799',
        orange_alt = '#FFCFA8',

        -- UI colors
        selection = '#FFFFFF',
        cursor = '#FFC799'
    }
}

local vesper = {}

function vesper.select(palette)
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
                fg_color = colors[palette].yellow,
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

function vesper.setup(options)
    -- default options
    options = options or {}
    local flavor = options.flavor or 'default'

    return vesper.select(flavor)
end

return vesper
