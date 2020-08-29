local S = farming.intllib

minetest.register_craftitem("farming:ketchup", {
	description = S("Ketchup"),
	inventory_image = "farming_ketchup.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:ketchup",
	recipe = {
		"farming:juicer", "farming:tomato", "",
		"", "", "",
		"", "", ""
	},
	replacements = {
		{"farming:juicer", "farming:juicer"},
	},
})

minetest.register_craftitem("farming:mustard", {
	description = S("Mustard"),
	inventory_image = "farming_mustard.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:mustard",
	recipe = {
		"farming:juicer", "farming:seed_mustard", "",
		"", "", "",
		"", "", ""
	},
	replacements = {
		{"farming:juicer", "farming:juicer"},
	},
})

minetest.register_craftitem("farming:bbq", {
	description = S("BBQ Sauce"),
	inventory_image = "farming_bbq_sauce.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:bbq",
	recipe = {
		"farming:saucepan", "group:food_sugar", "farming:tomato",
		"farming:pepper_ground", "farming:vinegar", "farming:seed_mustard",
		"", "", ""
	},
	replacements = {
		{"farming:saucepan", "farming:saucepan"},
	},
})

minetest.register_craftitem("farming:vinegar", {
	description = S("Vinegar"),
	inventory_image = "farming_vinegar.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:vinegar",
	recipe = {
		"farming:pot", "farming:juice_grape", "",
		"", "", "",
		"", "", ""
	},
	replacements = {
		{"farming:pot", "farming:pot"},
	},
})

minetest.register_craftitem("farming:mayo", {
	description = S("Mayo"),
	inventory_image = "farming_mayo.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:mayo",
	recipe = {
		"farming:juicer", "group:food_egg", "",
		"", "", "",
		"", "", ""
	},
	replacements = {
		{"farming:juicer", "farming:juicer"},
	},
})