minetest.register_craftitem("farming:broccoli_corn_salad", {
	description = ("Broccoli & Corn Salad"),
	inventory_image = "farming_broccoli_corn_salad.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:broccoli_corn_salad",
	recipe = {
		"farming:bowl", "farming:broccoli", "",
		"farming:corn_cob", "", "",
		"", "", ""
	},
})

minetest.register_craftitem("farming:potato_salad", {
	description = ("Potato Salad"),
	inventory_image = "farming_potato_salad.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:potato_salad",
	recipe = {
		"farming:bowl", "farming:potato", "",
		"farming:mayo", "", "",
		"", "", ""
	},
})

minetest.register_craftitem("farming:carrot_lettuce_salad", {
	description = ("Carrot & Lettuce Salad"),
	inventory_image = "farming_carrot_lettuce_salad.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:carrot_lettuce_salad",
	recipe = {
		"farming:bowl", "farming:carrot", "",
		"farming:lettuce", "", "",
		"", "", ""
	},
})