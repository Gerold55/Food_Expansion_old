local S = farming.intllib

-- blueberry juice
minetest.register_craftitem("farming:juice_blueberry", {
	description = S("Blueberry Juice"),
	inventory_image = "farming_juice_blueberry.png",
	groups = {food_juice = 1, flammable = 2},
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming:juice_blueberry",
	type = "shapeless",
	recipe = {
		"farming:juicer", "farming:blueberries", "",
		"farming:blueberries", "", "",
		"", "", ""
	},
	replacements = {
		{"group:food_juicer", "farming:juicer"},
	},
})

minetest.register_craftitem("farming:pie_blueberry", {
	description = S("Blueberry Pie"),
	inventory_image = "farming_pie_blueberry.png",
	groups = {food_juice = 1, flammable = 2},
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming:pie_blueberry 9",
	type = "shapeless",
	recipe = {
		"farming:bakeware", "farming:blueberries", "",
		"farming:dough", "group:food_sugar", "",
		"", "", ""
	},
	replacements = {
		{"farming:bakeware", "farming:bakeware"},
	},
})

minetest.register_craftitem("farming:muffin_blueberry", {
	description = S("Blueberry Muffin"),
	inventory_image = "farming_muffin_blueberry.png",
	groups = {food_juice = 1, flammable = 2},
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming:muffin_blueberry",
	type = "shapeless",
	recipe = {
		"farming:bakeware", "farming:blueberries", "",
		"farming:batter", "", "",
		"", "", ""
	},
	replacements = {
		{"farming:bakeware", "farming:bakeware"},
	},
})

minetest.register_craftitem("farming:pancakes_blueberry", {
	description = S("Blueberry Pancakes"),
	inventory_image = "farming_pancakes_blueberry.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:pancakes_blueberry",
	recipe = {
		"farming:pancakes", "farming:blueberries", "", 
		"", "", "",
		"", "", ""
	}
})

minetest.register_craftitem("farming:jelly_blueberry", {
	description = S("Blueberry Jelly"),
	inventory_image = "farming_jelly_blueberry.png",
	groups = {food_jelly = 1},
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:jelly_blueberry",
	recipe = {
		"farming:saucepan", "farming:blueberries", "", 
		"group:food_sugar", "", "",
		"", "", ""
	}
})

minetest.register_craftitem("farming:sandwich_blueberryjelly", {
	description = ("Blueberry Jelly Sandwich"),
	inventory_image = "farming_sandwich_bj.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	output = "farming:sandwich_blueberryjelly",
	recipe = {
		{"farming:cutting_board", "farming:jelly_blueberry", ""},
		{"farming:bread_slice", "", ""},
		{"", "", ""},
	},
	replacements = {{ "farming:cutting_board", "farming:cutting_board"}}
})