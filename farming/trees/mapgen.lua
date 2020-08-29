local modname = "farming"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")
-- internationalization boilerplate
local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_decoration({
	name = "farming:tree_apple",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 2,
	noise_params = {
		offset = 0.0001,
		scale = 0.00004,
		spread = {x = 200000, y = 200000, z = 200000},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"grassland", "snowy_grassland"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/apple_tree.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

minetest.register_decoration({
	name = "farming:tree_apple2",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 2,
	noise_params = {
		offset = 0.0001,
		scale = 0.00004,
		spread = {x = 200000, y = 200000, z = 200000},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"grassland", "snowy_grassland"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/apple_tree2.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

minetest.register_decoration({
	name = "farming:tree_orange",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 2,
	noise_params = {
		offset = 0.0001,
		scale = 0.00004,
		spread = {x = 200000, y = 200000, z = 200000},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"grassland", "snowy_grassland"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/orange_tree.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

minetest.register_decoration({
	name = "farming:tree_orange2",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 2,
	noise_params = {
		offset = 0.0001,
		scale = 0.00004,
		spread = {x = 200000, y = 200000, z = 200000},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"grassland", "snowy_grassland"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/orange_tree2.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

minetest.register_decoration({
	name = "farming:tree_pomegranate",
	deco_type = "schematic",
	place_on = {"default:dirt_with_snow", "default:dirt_with_coniferous_litter"},
	sidelen = 2,
	noise_params = {
		offset = 0.0001,
		scale = 0.00004,
		spread = {x = 200000, y = 200000, z = 200000},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"taiga", "coniferous_forest", "snowy_grassland"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/pomegranate_tree.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

minetest.register_decoration({
	name = "farming:tree_cinnamon",
	deco_type = "schematic",
	place_on = {"default:dirt_with_coniferous_litter"},
	sidelen = 2,
	noise_params = {
		offset = 0.0001,
		scale = 0.00004,
		spread = {x = 200000, y = 200000, z = 200000},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"coniferous_forest"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/cinnamon_tree.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

minetest.register_decoration({
	name = "farming:tree_paperbark",
	deco_type = "schematic",
	place_on = {"default:dirt_with_coniferous_litter"},
	sidelen = 2,
	noise_params = {
		offset = 0.0001,
		scale = 0.00004,
		spread = {x = 200000, y = 200000, z = 200000},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"coniferous_forest"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/paper_tree.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})