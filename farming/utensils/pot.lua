minetest.register_craftitem("farming:pot", {
	description = ("Pot"),
	inventory_image = "farming_pot.png",
})

minetest.register_craft({
	output = 'farming:pot',
	recipe = {
		{"", "",  "",},
		{"default:stick", "default:brick",  "default:brick",},
		{"", "default:brick", "default:brick"},
	}
})
