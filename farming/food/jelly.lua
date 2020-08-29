local S = farming.intllib

minetest.register_craftitem("farming:jelly_grape", {
	description = S("Grape Jelly"),
	inventory_image = "farming_jelly_grape.png",
	groups = {food_jelly = 1, food_type_snack = 1},
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming:jelly_grape",
	type = "shapeless",
	recipe = {
		"farming:saucepan", "farming:grapes", "",
		"group:food_sugar", "", "",
		"", "", ""
	},
	replacements = {
		{"farming:saucepan", "farming:saucepan"},
	},
})

