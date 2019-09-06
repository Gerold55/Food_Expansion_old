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
		"farming:saucepan", "farming:sugar", "",
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