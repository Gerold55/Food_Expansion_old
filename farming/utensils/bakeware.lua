minetest.register_craftitem("farming:bakeware", {
	description = ("Bakeware"),
	inventory_image = "farming_bakeware.png",
})

minetest.register_craft({
	output = 'farming:bakeware',
	recipe = {
		{"default:brick", "default:brick",  "default:brick",},
		{"default:brick", "",  "default:brick",},
		{"default:brick", "default:brick", "default:brick"},
	}
})
