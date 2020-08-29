minetest.register_craftitem("farming:caramel", {
	description = ("Caramel"),
	inventory_image = "farming_caramel.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:caramel",
	recipe = {
		"farming:saucepan", "group:food_sugar", "",
		"", "", "",
		"", "", ""
	},
})

minetest.register_craftitem("farming:royal_jelly", {
	description = ("Royal Jelly"),
	inventory_image = "farming_jelly_royal.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:royal_jelly",
	recipe = {
		"bees:bees", "", "",
		"", "", "",
		"", "", ""
	},
})

-- cookies
minetest.register_craftitem("farming:cookies_peanut_butter", {
	description = ("Peanut Butter Cookies"),
	inventory_image = "farming_peanut_butter_cookies.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:cookies_peanut_butter 2",
	recipe = {
		"farming:bakeware", "group:food_nut_butter", "",
		"farming:batter", "group:food_sugar", "",
		"", "", ""
	}
})

-- donuts 

minetest.register_craftitem("farming:donut", {
	description = ("Donut"),
	inventory_image = "farming_donut.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:donut",
	recipe = {
		"farming:pot", "farming:dough", "",
		"farming:cooking_oil", "", "",
		"", "", ""
	},
	replacements = {{"farming:pot", "farming:pot"}},
})

minetest.register_craftitem("farming:donut_chocolate", {
	description = ("Chocolate Frosted Donut"),
	inventory_image = "farming_donut_chocolate.png",
})

minetest.register_craft({
	output = "farming:donut_chocolate",
	recipe = {
		{"group:food_cocoa"},
		{"farming:donut"}
	}
})

minetest.register_craftitem("farming:donut_vanilla", {
	description = ("Vanilla Frosted Donut"),
	inventory_image = "farming_donut_vanilla.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:donut_vanilla",
	recipe = {
		"farming:donut", "group:food_sugar", "dye:red",
		"dye:dark_green", "dye:yellow", "",
		"", "", ""
	}
})

minetest.register_craftitem("farming:donut_powdered", {
	description = ("Powdered Donut"),
	inventory_image = "farming_donut_powdered.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:donut_powdered",
	recipe = {
		"farming:donut", "group:food_sugar", "",
		"", "", "",
		"", "", ""
	}
})

minetest.register_craftitem("farming:donut_jelly", {
	description = ("Powdered Donut"),
	inventory_image = "farming_donut_jelly.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:donut_jelly",
	recipe = {
		"farming:donut", "farming:jelly_grape", "",
		"", "", "",
		"", "", ""
	}
})