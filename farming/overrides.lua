--From the bbq mod by Grizzly Adams

if  minetest.registered_items["mobs_animal:cow"] ~= nil then
local def = minetest.registered_entities["mobs_animal:cow"]
assert(def, "mobs:cow not found")
def.drops = {
		{name = "farming:beef_raw", chance = 1, min = 1, max = 3},
		{name = "mobs:leather", chance = 1, min = 1, max = 2},
}
end

if  minetest.registered_items["mobs_animal:chicken"] ~= nil then
local def = minetest.registered_entities["mobs_animal:chicken"]
assert(def, "mobs:chicken not found")
def.drops = {
		{name = "farming:chicken_raw", chance = 1, min = 1, max = 3},
		{name = "mobs:chicken_feather", chance = 1, min = 1, max = 2},
}
end