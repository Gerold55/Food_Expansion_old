minetest.register_decoration({
	name = "farming:tree_tea",
	deco_type = "schematic",
	place_on = {"default:grass"},
	sidelen = 2,
	noise_params = {
		offset = 0.0001,
		scale = 0.00004,
		spread = {x = 200000, y = 200000, z = 200000},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"grassland, savanna, taiga"},
	y_min = 2,
	y_max = 80,
	schematic = "farming/schematics/tea_tree.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})