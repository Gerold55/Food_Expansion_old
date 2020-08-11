-- VARIABLE INITIALIZATION
local thismod = minetest.get_current_modname()

local modpath = minetest.get_modpath(thismod)

old_expansion = {
    growNodes = {"default:dirt","default:dirt_with_grass","default:dirt_with_snow"},
    growthSources = {},
    schems = {},
    types = { logs = {"cinnamon", "paperbark"}}
}
old_expansion.growthSources.names = {"default:dirt", "default:dirt_with_grass", "default:water_source", "default:water_flowing", "default:ice", "default:dirt_with_snow",}
old_expansion.growthSources.values = {6, 4, 4, 3, -6, 2}