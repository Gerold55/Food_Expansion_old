minetest.register_craftitem("farming:apple", {
	description = "Apple",
	drawtype = "plantlike",
	tiles = {"farming_apple.png"},
	inventory_image = "farming_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1, food_apple = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("farming:cherry",{
    description = "Cherry",
    inventory_image = "farming_cherries.png",
    groups = {fruity = 1},
	on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_craftitem("farming:avocado",{
    description = "Avocado",
    inventory_image = "farming_avocado.png",
    groups = {fruity = 1},
	on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_craftitem("farming:pear",{
    description = "Pear",
    inventory_image = "farming_pear.png",
    groups = {fruity = 1},
	on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_craftitem("farming:kiwi",{
    description = "Kiwi",
    inventory_image = "farming_kiwi.png",
    groups = {fruity = 1},
	on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_craftitem("farming:lemon",{
    description = "Lemon",
    inventory_image = "farming_lemon.png",
    groups = {fruity = 1}
})

minetest.register_craftitem("farming:cinnamon",{
    description = "Cinnamon",
    inventory_image = "cinnamon.png"
})

minetest.register_craftitem("farming:coconut",{
    description = "Coconut",
    inventory_image = "farming_coconut.png",
    groups = {fruity = 1}
})

minetest.register_craftitem("farming:orange",{
    description = "Orange",
    inventory_image = "farming_orange.png",
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_craftitem("farming:olives",{
    description = "Olives",
    inventory_image = "farming_olives.png",
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_craftitem("farming:pomegranate",{
    description = "Pomegranate",
    inventory_image = "farming_pomegranate.png",
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_craftitem("farming:apricot",{
    description = "Apricot",
    inventory_image = "farming_apricot.png",
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_craftitem("farming:pear",{
    description = "Pear",
    inventory_image = "farming_pear.png",
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_craftitem("farming:mango",{
    description = "Mango",
    inventory_image = "farming_mango.png",
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_craftitem("farming:banana",{
    description = "Bananas",
    inventory_image = "farming_banana.png",
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_craftitem("farming:grapes",{
    description = "Grapes",
    inventory_image = "farming_grapes.png",
    groups = {fruity = 1},
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})

minetest.register_craftitem("farming:pecan",{
    description = "Pecan",
    inventory_image = "farming_pecans.png",
    on_use = function(itemstack,user,pointed_thing)
        if(hbhunger)then
			local player = user
			hbhunger.heal(player)
			itemstack:take_item()
            else 
        end
        return itemstack
    end
})