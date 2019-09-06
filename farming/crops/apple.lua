minetest.register_craftitem("farming:apple_pie", {
	description = ("Apple Pie"),
	inventory_image = "farming_pie_apple.png",
	on_use = minetest.item_eat(5),
	groups = {food_pie = 1, flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:apple_pie",
	recipe = {
		"farming:baking_tray", "default:apple",  "",
		"farming:sugar", "farming:dough",  "",
		"", "", ""
	},
	replacements = {
		{"farming:baking_tray", "farming:baking_tray"},
	}
})

minetest.register_craftitem("farming:apple_fritter", {
	description = ("Apple Fritter"),
	inventory_image = "farming_fritter_apple.png",
	on_use = minetest.item_eat(5),
	groups = {food_pie = 1, flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:apple_fritter",
	recipe = {
		"farming:pot", "default:apple", "farming:dough",
		"farming:sugar", "farming:cooking_oil", "",
		"", "", ""
	},
	replacements = {
		{"farming:pot", "farming:pot"},
	}
})

minetest.register_craftitem("farming:apple_sauce", {
	description = ("Apple Sauce"),
	inventory_image = "farming_sauce_apple.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:apple_sauce",
	recipe = {
		"farming:pot", "default:apple", "",
		"", "", "",
		"", "", ""
	},
	replacements = {
		{"farming:pot", "farming:pot"},
	}
})

minetest.register_craftitem("farming:apple_caramel", {
	description = ("Caramel Apple"),
	inventory_image = "farming_apple_caramel.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:apple_caramel",
	recipe = {
		"default:apple", "farming:caramel", "",
		"default:stick", "", "",
		"", "", ""
	},
})

minetest.register_craftitem("farming:apple_juice", {
	description = ("Apple Juice"),
	inventory_image = "farming_apple_juice.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:apple_juice",
	recipe = {
		"farming:juicer", "default:apple", "",
		"default:apple", "", "",
		"", "", ""
	},
	replacements = {
		{"farming:juicer", "farming:juicer"},
	}
})

minetest.register_craftitem("farming:apple_cider", {
	description = ("Apple Cider"),
	inventory_image = "farming_apple_cider.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:apple_cider",
	recipe = {
		"farming:pot", "default:apple", "",
		"farming:sugar", "", "",
		"", "", ""
	},
	replacements = {
		{"farming:pot", "farming:pot"},
	}
})

minetest.register_craftitem("farming:apple_smoothie", {
	description = ("Apple Cider"),
	inventory_image = "farming_apple_smoothie.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:apple_smoothie",
	recipe = {
		"farming:pot", "default:apple", "",
		"farming:sugar", "default:snowball", "",
		"", "", ""
	},
	
replacements = {
		{"farming:pot", "farming:pot"},
	}
})

minetest.register_craftitem("farming:apple_snow", {
	description = ("Apple Snow"),
	inventory_image = "farming_apple_snow.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:apple_snow",
	recipe = {
		"farming:cutting_board", "farming:meringue", "",
		"farming:butter", "default:apple", "",
		"", "", ""
	},
	replacements = {
		{"farming:cutting_board", "farming:cutting_board"},
	}
})

