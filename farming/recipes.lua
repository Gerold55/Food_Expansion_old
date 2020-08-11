minetest.register_craft({
	output = "farming:soy_milk",
	recipe = {
		{"group:food_sugar", "group:food_milk", "group:food_sugar"},
		{"group:food_sugar", "group:food_egg", "group:food_sugar"},
		{"group:food_wheat", "group:food_flour", "group:food_wheat"},
	},
	replacements = {{ "mobs:bucket_milk", "bucket:bucket_empty"}}
})

minetest.register_craft({
	output = "farming:sauce_soy",
	recipe = {
		{"farming:juicer", "farming:soybeans", ""},
		{"group:water", "farming:salt", ""},
		{"", "", ""},
	},
	replacements = {{ "default:water", "bucket:bucket_empty"}}
})
