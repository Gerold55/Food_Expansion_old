local S = farming.intllib

minetest.register_craftitem("farming:noodles", {
	description = S("Noodles"),
	inventory_image = "farming_noodles.png",
	groups = {food_pasta = 1},
})

minetest.register_craft({
	output = "farming:noodles",
	type = "shapeless",
	recipe = {
		"farming:mixing_bowl", "farming:dough", "",
		"farming:butter", "", "",
		"", "", ""
	},
	replacements = {
		{"farming:mixing_bowl", "farming:mixing_bowl"},
	},
})

minetest.register_craftitem("farming:pasta", {
	description = S("Pasta"),
	inventory_image = "farming_pasta.png",
	groups = {food_pasta = 1, food_type_meal = 1},
})

minetest.register_craft({
	output = "farming:pasta",
	type = "shapeless",
	recipe = {
		"farming:cutting_board", "farming:dough", "",
		"", "", "",
		"", "", ""
	},
	replacements = {
		{"farming:cutting_board", "farming:cutting_board"},
	},
})

minetest.register_craftitem("farming:lasagna", {
	description = S("Lasagna"),
	inventory_image = "farming_lasagna.png",
	groups = {food_type_meal = 1},
})

minetest.register_craft({
	output = "farming:lasagna",
	type = "shapeless",
	recipe = {
		"farming:bakeware", "farming:pasta", "farming:cheese_slice",
		"farming:tomato", "farming:onion", "farming:garlic_clove",
		"", "", ""
	},
	replacements = {
		{"farming:bakeware", "farming:bakeware"},
	},
})

minetest.register_craftitem("farming:spaghetti", {
	description = S("Spaghetti"),
	inventory_image = "farming_spaghetti.png",
	groups = {food_type_meal = 1},
})

minetest.register_craft({
	output = "farming:spaghetti",
	type = "shapeless",
	recipe = {
		"farming:saucepan", "farming:tomato", "",
		"farming:pasta", "farming:garlic_clove", "",
		"", "", ""
	},
	replacements = {
		{"farming:saucepan", "farming:saucepan"},
	},
})
