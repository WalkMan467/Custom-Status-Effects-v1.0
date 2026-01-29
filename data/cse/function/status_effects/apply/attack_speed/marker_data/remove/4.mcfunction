scoreboard players reset @s cse.status_effects.attack_speed
scoreboard players reset @s cse.status_effects.attack_speed.base.value
scoreboard players reset @s cse.status_effects.attack_speed.value.max
scoreboard players reset @s cse.status_effects.attack_speed.value

function cse:status_effects/apply/attack_speed/marker_data/remove/5

$attribute @s minecraft:attack_speed modifier remove cse.status_effects.attack_speed.$(id)