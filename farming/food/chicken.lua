local S = farming.intllib

minetest.register_craftitem("farming:chicken_raw", {
	description = S("Chicken"),
	inventory_image = "farming_chicken_raw.png",
	groups = {food_meat_all = 1},
})

minetest.register_craftitem("farming:chicken_cooked", {
	description = S("Chicken"),
	inventory_image = "farming_chicken_cook.png",
	groups = {food_chicken = 1},
})

minetest.register_craftitem("farming:pie_chicken_pot", {
	description = S("Chicken Pot Pie"),
	inventory_image = "farming_pie_chicken.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming:pie_chicken_pot",
	type = "shapeless",
	recipe = {
		"farming:bakeware", "group:food_chicken", "farming:potato",
		"farming:carrot", "farming:dough", "",
		"", "", ""
	},
	replacements = {
		{"farming:bakeware", "farming:bakeware"},
	},
})

minetest.register_craftitem("farming:chicken_fried", {
	description = S("Fried Chicken"),
	inventory_image = "farming_fried_chicken.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming:chicken_fried",
	type = "shapeless",
	recipe = {
		"farming:pot", "group:food_chicken", "farming:batter",
		"farming:spice_leaf", "farming:pepper_ground", "farming:cooking_oil",
		"", "", ""
	},
	replacements = {
		{"farming:pot", "farming:pot"},
	},
})

minetest.register_craftitem("farming:chicken_n_waffles", {
	description = S("Chicken & Waffles"),
	inventory_image = "farming_waffles_chicken.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming:chicken_n_waffles",
	type = "shapeless",
	recipe = {
		"farming:cutting_board", "farming:chicken_fried", "",
		"waffles:large_waffle", "", "",
		"", "", ""
	},
	replacements = {
		{"farming:cutting_board", "farming:cutting_board"},
	},
})

minetest.register_craftitem("farming:sandwich_chicken", {
	description = S("Chicken Sandwich"),
	inventory_image = "farming_sandwich_chicken.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming:sandwich_chicken",
	type = "shapeless",
	recipe = {
		"farming:skillet", "group:food_chicken", "",
		"farming:bun", "farming:mayo", "",
		"", "", ""
	},
	replacements = {
		{"farming:cutting_board", "farming:cutting_board"},
	},
})