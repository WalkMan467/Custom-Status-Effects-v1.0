scoreboard players reset @s cse.status_effects.flying_speed
scoreboard players reset @s cse.status_effects.flying_speed.base.value
scoreboard players reset @s cse.status_effects.flying_speed.value.max
scoreboard players reset @s cse.status_effects.flying_speed.value

function cse:status_effects/apply/flying_speed/marker_data/remove/5

$attribute @s minecraft:flying_speed modifier remove cse.status_effects.flying_speed.$(id)