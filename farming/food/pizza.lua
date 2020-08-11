minetest.register_craftitem("farming:pizza", {
	description = ("Pizza"),
	inventory_image = "farming_pizza.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:pizza",
	recipe = {
		"farming:juicer", "farming:tomato", "",
		"", "", "",
		"", "", ""
	},
})