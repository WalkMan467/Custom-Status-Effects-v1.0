scoreboard players reset @s cse.status_effects.sneaking_speed
scoreboard players reset @s cse.status_effects.sneaking_speed.base.value
scoreboard players reset @s cse.status_effects.sneaking_speed.value.max
scoreboard players reset @s cse.status_effects.sneaking_speed.value

function cse:status_effects/apply/sneaking_speed/marker_data/remove/5

$attribute @s minecraft:sneaking_speed modifier remove cse.status_effects.sneaking_speed.$(id)