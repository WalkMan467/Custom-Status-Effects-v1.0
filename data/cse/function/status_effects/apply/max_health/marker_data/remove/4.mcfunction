scoreboard players reset @s cse.status_effects.max_health
scoreboard players reset @s cse.status_effects.max_health.base.value
scoreboard players reset @s cse.status_effects.max_health.value.max
scoreboard players reset @s cse.status_effects.max_health.value

function cse:status_effects/apply/max_health/marker_data/remove/5

$attribute @s minecraft:max_health modifier remove cse.status_effects.max_health.$(id)