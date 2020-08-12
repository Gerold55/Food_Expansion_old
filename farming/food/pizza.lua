minetest.register_craftitem("farming:pizza_pepperoni", {
	description = ("Pepperoni Pizza"),
	inventory_image = "farming_pepperoni_pizza.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	output = "farming:pizza_pepperoni",
	recipe = {
		{"farming:bakeware", "farming:dough", "farming:tomato"},
		{"group:food_cheese", "farming:pepperoni", ""},
		{"", "", ""},
	},
	replacements = {{ "farming:bakeware", "farming:bakeware"}}
})
