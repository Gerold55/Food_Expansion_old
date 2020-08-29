local S = farming.intllib

minetest.register_craftitem("farming:beef_raw", {
	description = S("Raw Beef"),
	inventory_image = "farming_beef_raw.png",
	groups = {food_meat = 1, food_meat_all = 1},
})

minetest.register_craftitem("farming:beef_cooked", {
	description = S("Beef"),
	inventory_image = "farming_beef_cooked.png",
	groups = {food_meat = 1},
})

minetest.register_craftitem("farming:beef_ground", {
	description = S("Ground Beef"),
	inventory_image = "farming_beef_ground.png",
	groups = {food_meat = 1},
})

minetest.register_craftitem("farming:beef_patty_raw", {
	description = S("Raw Gourmet Beef Patty"),
	inventory_image = "farming_patty_raw.png",
	groups = {food_meat = 1},
})

minetest.register_craftitem("farming:beef_patty_cooked", {
	description = S("Gourmet Beef Patty"),
	inventory_image = "farming_patty_cooked.png",
	groups = {food_meat = 1},
})

minetest.register_craft({
	type = "cooking",
	cooktime = 4,
	output = "farming:beef_cooked",
	recipe = "farming:beef_raw"
})

minetest.register_craftitem("farming:beef_jerky", {
	description = S("Beef Jerky"),
	inventory_image = "farming_jerky_beef.png",
	groups = {food_jelly = 1},
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming:beef_jerky",
	type = "shapeless",
	recipe = {
		"group:food_meat", "farming:salt", "",
		"", "", "",
		"", "", ""
	}
})