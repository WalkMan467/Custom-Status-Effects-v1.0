scoreboard players reset @s cse.status_effects.movement_speed
scoreboard players reset @s cse.status_effects.movement_speed.base.value
scoreboard players reset @s cse.status_effects.movement_speed.value.max
scoreboard players reset @s cse.status_effects.movement_speed.value

function cse:status_effects/apply/movement_speed/marker_data/remove/5

$attribute @s minecraft:movement_speed modifier remove cse.status_effects.movement_speed.$(id)