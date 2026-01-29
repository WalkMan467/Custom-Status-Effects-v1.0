scoreboard players reset @s cse.status_effects.water_movement_efficiency
scoreboard players reset @s cse.status_effects.water_movement_efficiency.base.value
scoreboard players reset @s cse.status_effects.water_movement_efficiency.value.max
scoreboard players reset @s cse.status_effects.water_movement_efficiency.value

function cse:status_effects/apply/water_movement_efficiency/marker_data/remove/5

$attribute @s minecraft:water_movement_efficiency modifier remove cse.status_effects.water_movement_efficiency.$(id)