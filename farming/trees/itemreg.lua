minetest.register_craftitem("farming:cherry",{
    description = "Cherry",
    inventory_image = "wls_cherry.png",
    groups = {fruity = 1}
})
minetest.register_craftitem("farming:avocado",{
    description = "Avocado",
    inventory_image = "avocado.png",
    groups = {fruity = 1}
})
minetest.register_craftitem("farming:pear",{
    description = "Pear",
    inventory_image = "pear.png",
    groups = {fruity = 1}
})
minetest.register_craftitem("farming:kiwi",{
    description = "Kiwi",
    inventory_image = "kiwi.png",
    groups = {fruity = 1}
})
minetest.register_craftitem("farming:lemon",{
    description = "lemon",
    inventory_image = "lemon.png",
    groups = {fruity = 1}
})
minetest.register_craftitem("farming:cinnamon",{
    description = "cinnamon",
    inventory_image = "cinnamon.png",
    groups = {fruity = 1}
})
minetest.register_craftitem("farming:coconut",{
    description = "coconut",
    inventory_image = "coconut.png",
    groups = {fruity = 1}
})
minetest.register_craftitem("farming:orange",{
    description = "orange",
    inventory_image = "orange.png",
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
minetest.register_craftitem("farming:monsterflesh_raw",{
	description = "Raw Monster Flesh",
	groups = {food = 1, meaty = 1},
	inventory_image = "maultest.png",
})

minetest.register_craftitem("farming:dirt_bar",{
	description = "Dirt Bar",
	groups = {food = 1, dirty = 1},
    inventory_image = "dirt_bar.png",
    on_use = function(itemstack, user, pointed_thing)
        if(hbhunger)then
        local pl_hunger = hbhunger.hunger[user:get_player_name()]
        if(pl_hunger <= 8)then
        hbhunger.hunger[user:get_player_name()] = pl_hunger + 4
        itemstack:take_item()
        else minetest.chat_send_player(user:get_player_name(),"You cannot stomach another bite of dust!")
        end
    else end
        return itemstack
    end
})