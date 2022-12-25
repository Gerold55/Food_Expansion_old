local modname = "farming"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")
-- internationalization boilerplate
local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_alias("default:apple_tree", "farming:tree_apple")
minetest.register_alias("default:apple_tree", "farming:tree_apple2")

minetest.register_decoration({
	name = "farming:tree_apple",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 2,
	noise_params = {
			offset = 0.030,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
	biomes = {"grassland","deciduous_forest"},
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
			offset = 0.030,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
	biomes = {"grassland","deciduous_forest"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/apple_tree2.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

	minetest.register_decoration({
		name = "farming:apple_log",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		place_offset_y = 1,
		sidelen = 16,
		noise_params = {
			offset = 0.0012,
			scale = 0.0007,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/apple_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = "default:dirt_with_grass",
		num_spawn_by = 8,
	})
	
	
minetest.register_decoration({
	name = "farming:tree",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 2,
	noise_params = {
			offset = 0.020,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
	biomes = {"grassland","deciduous_forest"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/tree.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

minetest.register_decoration({
	name = "farming:tree2",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 2,
	noise_params = {
			offset = 0.20,
			scale = 0.015,
			spread = {x = 350, y = 350, z = 350},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
	biomes = {"grassland","deciduous_forest"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/tree2.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

minetest.register_decoration({
	name = "farming:tree_orange",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 2,
	noise_params = {
			offset = 0.023,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
	biomes = {"grassland","deciduous_forest"},
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
			offset = 0.024,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
	biomes = {"grassland", "deciduous_forest"},
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
			offset = 0.015,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
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
			offset = 0.015,
			scale = 0.015,
			spread = {x = 200, y = 200, z = 200},
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
			offset = 0.015,
			scale = 0.015,
			spread = {x = 150, y = 150, z = 150},
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

minetest.register_decoration({
	name = "farming:tree_peach",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 2,
	noise_params = {
			offset = 0.015,
			scale = 0.015,
			spread = {x = 200, y = 200, z = 200},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
	biomes = {"deciduous_forest"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/peach_tree.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

minetest.register_decoration({
	name = "farming:tree_peach2",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 2,
	noise_params = {
			offset = 0.016,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
	biomes = {"deciduous_forest"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/peach_tree2.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

minetest.register_decoration({
	name = "farming:tree_banana",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 2,
	noise_params = {
			offset = 0.015,
			scale = 0.015,
			spread = {x = 200, y = 200, z = 200},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
	biomes = {"rainforest"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/banana_tree.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

minetest.register_decoration({
	name = "farming:tree_banana2",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 2,
	noise_params = {
			offset = 0.016,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
	biomes = {"rainforest"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/banana_tree2.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

minetest.register_decoration({
	name = "farming:tree_cherry",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 2,
	noise_params = {
			offset = 0.016,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
	biomes = {"grasslands"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/cherry_tree.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

minetest.register_decoration({
	name = "farming:tree_tea",
	deco_type = "schematic",
	place_on = {"default:dry_dirt_with_dry_grass"},
		sidelen = 12,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
	biomes = {"savanna"},
	y_max = 31000,
	y_min = 1,
	schematic = "farming/schematics/tea_tree.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})