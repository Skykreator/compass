--item.lua

local poopShell = table.deepcopy(data.raw["ammo-category"]["bullet"])
poopShell.name = "poop-shell"

data:extend{poopShell}

local poop = table.deepcopy(data.raw["ammo"]["shotgun-shell"])
poop.name = "poop"
poop.ammo_type.category="poop-shell"
poop.ammo_type.magazine_size=50
poop.icon = "__compass__/graphics/poop.png"

local poopRecipe = table.deepcopy(data.raw["recipe"]["shotgun-shell"])
poopRecipe.enabled = true
poopRecipe.name = "poop"
poopRecipe.ingredients = {}
poopRecipe.result = "poop"
poopRecipe.energy_required = 3

data:extend{poop,poopRecipe}

local poopFuel = table.deepcopy(data.raw["item"]["coal"])
poopFuel.name = "compressed-poop"
poopFuel.fuel_value = "10MJ"
poopFuel.fuel_acceleration_multiplier = 1.3
poopFuel.fuel_top_speed_multiplier = 1.08
poopFuel.icon = "__compass__/graphics/compressedpoop.png"

local poopFuelRecipe = table.deepcopy(data.raw["recipe"]["small-electric-pole"])
poopFuelRecipe.enabled = true
poopFuelRecipe.name = "compressed-poop"
poopFuelRecipe.ingredients = {{"poop",5}}
poopFuelRecipe.result = "compressed-poop"
poopFuelRecipe.energy_required = 3

data:extend{poopFuel,poopFuelRecipe}

local poopGun = table.deepcopy(data.raw["gun"]["shotgun"])
poopGun.name = "poop-gun"
poopGun.icons = {
  {
    icon = poopGun.icon,
    tint = {r=0.588,g=0.294,b=0,a=0.3}
  },
}

poopGun.attack_parameters.ammo_category = "poop-shell"
poopGun.attack_parameters.cooldown = 12
poopGun.attack_parameters.movement_slow_down_factor = 1.1
poopGun.attack_parameters.range = 20

local poopGunRecipe = table.deepcopy(data.raw["recipe"]["shotgun"])
poopGunRecipe.enabled = true
poopGunRecipe.name = "poop-gun"
poopGunRecipe.ingredients = {{"wood",5},{"poop",10}}
poopGunRecipe.result = "poop-gun"

data:extend{poopGun,poopGunRecipe}