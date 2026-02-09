scoreboard players reset @s cse.status_effects.movement_efficiency
scoreboard players reset @s cse.status_effects.movement_efficiency.base.value
scoreboard players reset @s cse.status_effects.movement_efficiency.value.max
scoreboard players reset @s cse.status_effects.movement_efficiency.value

function cse:status_effects/apply/movement_efficiency/marker_data/remove/5

$attribute @s minecraft:movement_efficiency modifier remove cse.status_effects.movement_efficiency.$(id).$(type)