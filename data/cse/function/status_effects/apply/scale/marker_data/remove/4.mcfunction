scoreboard players reset @s cse.status_effects.scale
scoreboard players reset @s cse.status_effects.scale.base.value
scoreboard players reset @s cse.status_effects.scale.value.max
scoreboard players reset @s cse.status_effects.scale.value

function cse:status_effects/apply/scale/marker_data/remove/5

$attribute @s minecraft:scale modifier remove cse.status_effects.scale.$(id)