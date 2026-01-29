scoreboard players reset @s cse.status_effects.burning_time
scoreboard players reset @s cse.status_effects.burning_time.base.value
scoreboard players reset @s cse.status_effects.burning_time.value.max
scoreboard players reset @s cse.status_effects.burning_time.value

function cse:status_effects/apply/burning_time/marker_data/remove/5

$attribute @s minecraft:burning_time modifier remove cse.status_effects.burning_time.$(id)