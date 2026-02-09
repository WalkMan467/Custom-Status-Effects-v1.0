scoreboard players reset @s cse.status_effects.fall_damage_multiplier
scoreboard players reset @s cse.status_effects.fall_damage_multiplier.base.value
scoreboard players reset @s cse.status_effects.fall_damage_multiplier.value.max
scoreboard players reset @s cse.status_effects.fall_damage_multiplier.value

function cse:status_effects/apply/fall_damage_multiplier/marker_data/remove/5

$attribute @s minecraft:fall_damage_multiplier modifier remove cse.status_effects.fall_damage_multiplier.$(id).$(type)