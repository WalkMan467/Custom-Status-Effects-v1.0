scoreboard players reset @s cse.status_effects.sweeping_damage_ratio
scoreboard players reset @s cse.status_effects.sweeping_damage_ratio.base.value
scoreboard players reset @s cse.status_effects.sweeping_damage_ratio.value.max
scoreboard players reset @s cse.status_effects.sweeping_damage_ratio.value

function cse:status_effects/apply/sweeping_damage_ratio/marker_data/remove/5

$attribute @s minecraft:sweeping_damage_ratio modifier remove cse.status_effects.sweeping_damage_ratio.$(id)