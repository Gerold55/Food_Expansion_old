minetest.register_craftitem("farming:bait_fruit", {
	description = ("Fruit Bait"),
	inventory_image = "farming_bait_fruit.png",
	groups = {bait = 1, flammable = 2},
})

minetest.register_craftitem("farming:bait_fish", {
	description = ("Fish Bait"),
	inventory_image = "farming_bait_fish.png",
	groups = {bait = 1, flammable = 2},
})

minetest.register_craftitem("farming:juice_apple", {
	description = ("Apple Juice"),
	inventory_image = "farming_apple_juice.png",
	groups = {food_blackberry = 1, flammable = 2},
	on_use = minetest.item_eat(2),
})