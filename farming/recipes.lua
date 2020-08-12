minetest.register_craft({
	output = "farming:sauce_soy",
	recipe = {
		{"farming:juicer", "farming:soybeans", ""},
		{"group:water_bucket", "farming:salt", ""},
		{"", "", ""},
	},
	replacements = {{ "default:water_source", "bucket:bucket_empty"}},
	replacements = {{ "default:river_water_source", "bucket:bucket_empty"}}
})