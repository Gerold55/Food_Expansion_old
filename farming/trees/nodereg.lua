minetest.register_alias("farming:fruit_apple", "farming:apple")
minetest.register_alias("farming:fruit_cherry", "farming:cherry")
minetest.register_alias("farming:fruit_peach", "farming:peach")
minetest.register_alias("farming:fruit_pomegranate", "farming:pomegranate")
minetest.register_alias("farming:fruit_apricot", "farming:apricot")
minetest.register_alias("farming:fruit_cinnamon", "farming:cinnamon")
minetest.register_alias("farming:fruit_avocado", "farming:avocado")
minetest.register_alias("farming:fruit_fig", "farming:fig")
minetest.register_alias("farming:fruit_breadfruit", "farming:banana")
minetest.register_alias("farming:fruit_almond", "farming:almond")
minetest.register_alias("farming:fruit_cashew", "farming:cashew")
minetest.register_alias("farming:fruit_date", "farming:date")
minetest.register_alias("farming:fruit_dragonfruit", "farming:dragonfruit")
minetest.register_alias("farming:fruit_durian", "farming:durian")
minetest.register_alias("farming:fruit_guava", "farming:guava")
minetest.register_alias("farming:fruit_hazelnut", "farming:hazelnut")
minetest.register_alias("farming:fruit_grapefruit", "farming:grapefruit")
minetest.register_alias("farming:fruit_gooseberry", "farming:gooseberry")
minetest.register_alias("farming:fruit_jackfruit", "farming:jackfruit")
minetest.register_alias("farming:fruit_coconut", "farming:coconut")
minetest.register_alias("farming:fruit_candlenut", "farming:candlenut")
minetest.register_alias("farming:fruit_lemon", "farming:lemon")
minetest.register_alias("farming:fruit_lychee", "farming:lychee")
minetest.register_alias("farming:fruit_olives", "farming:olives")
minetest.register_alias("farming:fruit_nutmeg", "farming:nutmeg")
minetest.register_alias("farming:fruit_mango", "farming:mango")
minetest.register_alias("farming:fruit_orange", "farming:orange")
minetest.register_alias("farming:fruit_papaya", "farming:papaya")
minetest.register_alias("farming:fruit_passionfruit", "farming:passionfruit")
minetest.register_alias("farming:fruit_pecan", "farming:pecan")
minetest.register_alias("farming:fruit_persimmon", "farming:persimmon")
minetest.register_alias("farming:fruit_pistachio", "farming:pistachio")
minetest.register_alias("farming:fruit_plum", "farming:plum")
minetest.register_alias("farming:fruit_rambutan", "farming:rambutan")
minetest.register_alias("farming:fruit_soursop", "farming:soursop")
minetest.register_alias("farming:fruit_starfruit", "farming:starfruit")
minetest.register_alias("farming:fruit_tamarind", "farming:tamarind")
minetest.register_alias("farming:fruit_vanillabean", "farming:vanillabean")
minetest.register_alias("farming:fruit_walnut", "farming:walnut")
minetest.register_alias("farming:fruit_peppercorn", "farming:peppercorn")
minetest.register_alias("farming:fruit_spiderweb", "farming:spiderweb")
minetest.register_alias("farming:fruit_grapes", "farming:grapes")

minetest.register_node("farming:dev", {
	description = "dev",
	tiles = {"log2_mid.png",
			 "log2_mid.png",
			 "log2_side.png",
			 "log2_side.png",
			 "log2_side.png",
			 "log2_side.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1,oddly_breakable_by_hand = 1}
})

for n = 1, 3, 1 do
minetest.register_node("farming:leaves"..n, {
	description = "Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {
		"leaves"..n..".png"
	},
	paramtype = "light",
	groups = {cracky = 6, oddly_breakable_by_hand = 3, leaves = 1},
})
end

minetest.register_node("farming:bush1", {
	tiles = {
		"leaf1.png",
		"leaf1.png",
		"leaf1.png",
		"leaf1.png",
		"leaf1.png",
		"leaf1.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.1875, 0.0625},
			{-0.4375, -0.1875, -0.4375, 0.4375, 0.5, 0.4375},
		}
	},
	groups = {oddly_breakable_by_hand = 1}
})

minetest.register_node("farming:vanilla1", {
	tiles = {
		"log2_mid.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	waving = 2,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, 0.4375, -0.0625, 0, 0.5, 0},
			{-0.125, 0.375, -0.125, 0.0625, 0.4375, 0.0625},
			{-0.125, -0.1875, -0.125, 0.0625, 0.3125, 0.0625},
			{-0.0625, 0, -0.0625, 0, 0.375, 0},
		}
	},
	groups = {oddly_breakable_by_hand = 1}
})


----------------------------------------
---------------------------------------- MOD_DEFAULT
----------------------------------------
minetest.register_node("farming:log_2", {
	description = "Log",
	tiles = {"log2_mid.png",
			 "log2_mid.png",
			 "log2_side.png",
			 "log2_side.png",
			 "log2_side.png",
			 "log2_side.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1, oddly_breakable_by_hand = 3}
})

minetest.register_node("farming:log_2_heart", {
	description = "dev",
	tiles = {"log2_mid.png",
			 "log2_mid.png",
			 "log2_side.png",
			 "log2_side.png",
			 "log2_side.png",
			 "log2_side.png^[mask:hot.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1,oddly_breakable_by_hand = 4}
})


---------------------------------------PODS

minetest.register_node("farming:pod", {
	tiles = {"wls_podtex.png",},
	drawtype = "nodebox",
	waving = 2,
	walkable = false,
	paramtype = "light",
	paramtype2 = "wallmounted",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.25, -0.125, 0.0625, -0.4375, 0},
			{-0.0625, -0.4375, -0.1875, 0, -0.5, 0.0625}
		}
	},
	groups = {cracky = 6, oddly_breakable_by_hand = 6, not_in_creative_inventory = 1},
	on_punch = function(pos)
	local meta = minetest.get_meta(pos)
	minetest.chat_send_all(meta:get_string("type"))
	end
})

minetest.register_node("farming:pod2", {
	tiles = {"wls_podtex.png",},
	drawtype = "nodebox",
	waving = 2,
	walkable = false,
	paramtype = "light",
	paramtype2 = "wallmounted",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, 0, -0.125, 0.0625, -0.4375, 0},
			{-0.0625, -0.4375, -0.1875, 0, -0.5, 0.0625}
		}
	},
	groups = {oddly_breakable_by_hand = 10, not_in_creative_inventory = 1}
})

minetest.register_node("farming:pod3", {
	tiles = {"wls_podtex.png",},
	drawtype = "nodebox",
	waving = 2,
	walkable = false,
	paramtype = "light",
	paramtype2 = "wallmounted",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.1875, -0.125, 0.0625, -0.4375, 0},
			{-0.0625, -0.4375, -0.1875, 0, -0.5, 0.0625},
			{-0.125, 0.1875, -0.1875, 0.125, -0.1875, 0.0625}
		}
	},
	groups = {oddly_breakable_by_hand = 10, not_in_creative_inventory = 1}
})

minetest.register_node("farming:tree_tea", {
	description = "Tea Log",
	tiles = {"farming_bark_tea.png",
		{name = "farming_bark_tea.png"}},
	groups = {crumbly = 3},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.125, 0.125, 0.5, 0.0625}, -- NodeBox1
		}
	},
	drop = "default:stick",
})

minetest.register_node("farming:leaves_tea", {
	description = "Tea Leaves",
	tiles = {"leaves_tea.png",
		{name = "leaves_tea.png",
			tileable_vertical = false}},
	drawtype = "allfaces_optional",
	groups = {crumbly = 3},
	drop = "farming:tealeaf",
})

minetest.register_craftitem("farming:tealeaf", {
	description = "Tealeaf",
	inventory_image = "farming_tealeaf.png",
	groups = {flammable = 2},
})

minetest.register_node("farming:log_cinnamon", {
	description = "Cinnamon Log",
	tiles = {"log_cinnamon.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("farming:log_cinnamon_empty", {
	description = "Cinnamon Log",
	tiles = {"log_cinnamon.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
	drop = "default:tree",
	on_place = minetest.rotate_node
})

minetest.register_node("farming:log_paperbark", {
	description = "Paperbark Log",
	tiles = {"log_paperbark.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

--  --  --  --  --  --  --  Fruits
local fruit_names = {"cherries","pomegranate","peach","apricot","cinnamon","apple","avocado","fig","breadfruit","banana","almond","cashew","date","dragonfruit","durian","guava","hazelnut","grapefruit","gooseberry","jackfruit","coconut","candlenut","lemon","lime","lychee","olives","nutmeg","maple","mango","orange","papaya","passionfruit","pecan","persimmon","pistachio","plum","rambutan","soursop","starfruit","tamarind","vanillabean","walnut","peppercorn","paperbark","spiderweb","grapes"}
for k,v in ipairs(fruit_names)do 
	minetest.register_node("farming:fruit_"..v,{
		description = v,
		tiles = {"fruit_"..v..".png"},
		drawtype = "plantlike",
		inventory_image = "farming_"..v..".png",
		waving = 1,
		walkable = false,
		paramtype = "light",
		is_ground_content = true,
		on_use = minetest.item_eat(2),
		groups = {choppy=3, not_in_creative_inventory = 1, oddly_breakable_by_hand = 1, old_expansion_fruit = 2, leafdecay = 3, leafdecay_drop = 1, attached_node = 1},
		on_construct = function(pos)
			minetest.get_meta(pos):set_string("type", v)
		end,
		on_rightclick = function(pos, node, puncher, pointed_thing)
			local meta = minetest.get_meta(pos)
			local type = meta:get_string("type")
				minetest.set_node(pos, {name = "farming:pod"})
				meta:set_string("type",type)
				pos.y = pos.y - 0.2;
				minetest.add_item(pos,{name="farming:"..v, count = 1})
		
		end
	})

	minetest.register_node("farming:sapling_"..v,{
		description = v.." Sapling",
		tiles = {"sapling_"..v..".png"},
		inventory_image = {"sapling_"..v..".png"},
		drawtype = "plantlike",
		waving = 1,
		walkable = false,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = {choppy = 3, oddly_breakable_by_hand = 1, old_expansion_sapling = 2},
		on_punch = function(pos)
		local meta = minetest.get_meta(pos)
		minetest.chat_send_all(meta:get_int("growthlev"))
		end,
		on_construct = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(6)
		end,
		on_timer = function(pos)
			local t = { mself = minetest.get_meta(pos), below = { x= pos.x, y = pos.y - 1, z = pos.z}, neigh = {}, area = {{x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},{x = pos.x + 2, y = pos.y - 1, z = pos.z + 2}}}
			local name = minetest.get_node(t.below).name


			for n = 1, #old_expansion.growNodes, 1 do -- Check to ensure that supporting node is a valid growth node.
			
			if(name == old_expansion.growNodes[n])then
				name = true
			else end
			end

			if(name == true)then

			if(t.mself:get_int("growthlev") >= 0)then

				for n = 1, #old_expansion.growthSources.names, 1 do -- Incrementally add integers to meta growth level based on proximal nodes.
				
					local sources = minetest.find_nodes_in_area(t.area[1], t.area[2], old_expansion.growthSources.names[n])
					if(type(sources) == "table" and #sources >= 1)then
					t.mself:set_int("growthlev", t.mself:get_int("growthlev") + (#sources*old_expansion.growthSources.values[n]))
					else end
				end
			else minetest.set_node(pos, {name = "farming:sapling_dead"}) end -- Replace with dead sapling if growth falls below 0

			--Sprouting and pod assignment

			if(t.mself:get_int("growthlev") >= 130)then -- Full tree growth
				minetest.remove_node(pos)
				minetest.place_schematic({x = pos.x - 2, y = pos.y, z = pos.z - 2},old_expansion.tree_rand(),"random",_,false)
				local pods = minetest.find_nodes_in_area({x = pos.x - 2, y = pos.y, z = pos.z - 2},{x = pos.x + 2, y = pos.y + 7, z = pos.z + 2}, {"farming:pod"})
				local trunk = minetest.find_nodes_in_area({x = pos.x - 2, y = pos.y, z = pos.z - 2},{x = pos.x + 2, y = pos.y + 7, z = pos.z + 2}, {"farming:log_paperbark"})
				for o = 1, #trunk, 1 do
					minetest.set_node(trunk[o], {name = "farming:log_"..v})
				end
				if(type(pods) == "table" and #pods > 0)then
					for n = 1, #pods, 1 do
					local meta = minetest.get_meta(pods[n])
					if(meta:get_string("type") == "")then
						meta:set_string("type", v)
					else end
				end
				else end
			else end
			minetest.chat_send_all(t.mself:get_int("growthlev"))
			local timer = minetest.get_node_timer(pos)
			timer:start(6)
		else end
		end

	})

	local trunkList = {}

	for _, t in ipairs(old_expansion.types.logs) do
		table.insert(trunkList, "farming:log_"..v)
	end

	local leavesList = {"farming:fruit_"..v}

	for n = 1, 3, 1 do
		table.insert(leavesList, "farming:leaves"..n)
	end

	for p = 1, 3 do
		local pod = "farming:pod"

		if p > 1 then
			pod = pod..p
		end

		table.insert(leavesList, pod)
	end
end

minetest.register_node("farming:meshy", {
	drawtype = "mesh",
	tiles = {
		"log1_side.png"
	},
	mesh = "puddle.b3d",
})

-- Dirt Bar series (Because why not?)
local old_expansion_dirtbars = {"compressed","divided","barred"}
local old_expansion_dirtbars_tabs = {{
	type = "fixed",
	fixed = {
		{-0.4375, -0.5, -0.4375, 0.4375, -0.375, 0.4375}, -- NodeBox1
	}
},{
	type = "fixed",
	fixed = {
		{-0.4375, -0.5, -0.4375, -0.0625, -0.375, 0.4375}, -- NodeBox1
		{0.0625, -0.5, -0.4375, 0.4375, -0.375, 0.4375}, -- NodeBox2
	}
},{
	type = "fixed",
	fixed = {
		{-0.3125, -0.5, -0.1875, -0.0625, -0.375, 0.25}, -- NodeBox1
		{0.0625, -0.5, -0.1875, 0.3125, -0.375, 0.25}, -- NodeBox3
	}
}}

for k,v in ipairs(old_expansion_dirtbars) do
	minetest.register_node("farming:dirt_culinary_"..v,{
		description = v.." Soilent",
		tiles = {"ws_forest_litter.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {foody = 1, dirty = 1, oddly_breakable_by_hand = 1},
		drawtype = "nodebox",
		node_box = old_expansion_dirtbars_tabs[k],
		on_construct = function(pos)
			if(minetest.get_node(pos).name == "farming:dirt_culinary_barred")then
			local timer = minetest.get_node_timer(pos)
			if(minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name == "ws_basic:rack")then
				timer:start(100)else
			timer:start(180)
				end
			else end
		end,
		on_timer = function(pos)
			minetest.set_node(pos,{name = "farming:dirt_culinary_dried"})
		end,
		on_punch = function(pos, node, puncher, pointed_thing)
			minetest.set_node(pos,{name = node.name, param2 = node.param2 + 1})
			local p = puncher:get_wielded_item():get_name()
			if(p == "ws_core:knife_flint" and node.name == "farming:dirt_culinary_compressed") then
				minetest.set_node(pos,{name = "farming:dirt_culinary_divided", param2 = 0})
			elseif(p == "ws_core:knife_flint" and node.name == "farming:dirt_culinary_divided")then
				minetest.set_node(pos,{name = "farming:dirt_culinary_barred", param2 = 0})
			else end
		end
	})
	
minetest.register_craftitem("farming:apple", {
	description = "Apple",
	drawtype = "plantlike",
	tiles = {"farming_apple.png"},
	inventory_image = "farming_apple.png",
	drop = "farming:"..k,
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

minetest.register_craftitem("farming:cherries",{
    description = "Cherries",
    tiles = {"farming_cherry.png"},
	inventory_image = "farming_cherries.png",
	drop = "farming:"..k,
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
    tiles = {"farming_avocado.png"},
	inventory_image = "farming_avocado.png",
	drop = "farming:"..k,
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
    tiles = {"farming_pear.png"},
	inventory_image = "farming_pear.png",
	drop = "farming:"..k,
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
    tiles = {"farming_kiwi.png"},
	inventory_image = "farming_kiwi.png",
	drop = "farming:"..k,
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
    tiles = {"farming_lemon.png"},
	inventory_image = "farming_lemon.png",
	drop = "farming:"..k,
    groups = {fruity = 1}
})

minetest.register_craftitem("farming:cinnamon",{
    description = "Cinnamon",
    inventory_image = "cinnamon.png"
})

minetest.register_craftitem("farming:coconut",{
    description = "Coconut",
    tiles = {"farming_"..k..".png"},
	inventory_image = "farming_"..k..".png",
	drop = "farming:"..k,
    groups = {fruity = 1}
})

minetest.register_craftitem("farming:orange",{
    description = "Orange",
    tiles = {"farming_orange.png"},
	inventory_image = "farming_orange.png",
	drop = "farming:"..k,
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
    tiles = {"farming_olives.png"},
	inventory_image = "farming_olives.png",
	drop = "farming:"..k,
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
    tiles = {"fruit_pomegranate.png"},
	inventory_image = "fruit_pomegranate.png",
	drop = "farming:"..k,
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
    tiles = {"farming_apricot.png"},
	inventory_image = "farming_apricot.png",
	drop = "farming:"..k,
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
    tiles = {"farming_mango.png"},
	inventory_image = "farming_mango.png",
	drop = "farming:"..k,
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
    tiles = {"farming_banana.png"},
	inventory_image = "farming_banana.png",
	drop = "farming:"..k,
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

minetest.register_node("farming:banana_leaves",{
    description = "Banana Leaves",
    tiles = {"farming_banana_leaves.png"},
    groups = {choppy = 1},
})

minetest.register_node("farming:banana_trunk",{
    description = "Banana Trunk",
    tiles = {"farming_banana_trunk.png"},
    groups = {choppy = 1},
})

minetest.register_craftitem("farming:peach",{
    description = "Peach",
    tiles = {"farming_peach.png"},
	inventory_image = "farming_peach.png",
	drop = "farming:"..k,
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
    tiles = {"farming_grapes.png"},
	inventory_image = "farming_grapes.png",
	drop = "farming:"..k,
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
    tiles = {"farming_pecan.png"},
	inventory_image = "farming_pecan.png",
	drop = "farming:"..k,
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
end

minetest.register_node("farming:dirt_culinary_dried",{
	description = "Dried Soilent",
	tiles = {"ws_rocky_dirt.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {foody = 1, dirty = 1, oddly_breakable_by_hand = 1},
	drawtype = "nodebox",
	node_box = old_expansion_dirtbars_tabs[3],
	drop = "farming:dirt_bar"
})

minetest.register_node("farming:sapling_dead",{
	drawtype = "plantlike",
	tiles = {"sapling_dead.png"},
	groups = {oddly_breakable_by_hand = 1}
})
