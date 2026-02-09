scoreboard players reset @s cse.status_effects.gravity
scoreboard players reset @s cse.status_effects.gravity.base.value
scoreboard players reset @s cse.status_effects.gravity.value.max
scoreboard players reset @s cse.status_effects.gravity.value

function cse:status_effects/apply/gravity/marker_data/remove/5

$attribute @s minecraft:gravity modifier remove cse.status_effects.gravity.$(id).$(type)