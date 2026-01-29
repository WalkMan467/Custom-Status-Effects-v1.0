scoreboard players reset @s cse.status_effects.submerged_mining_speed
scoreboard players reset @s cse.status_effects.submerged_mining_speed.base.value
scoreboard players reset @s cse.status_effects.submerged_mining_speed.value.max
scoreboard players reset @s cse.status_effects.submerged_mining_speed.value

function cse:status_effects/apply/submerged_mining_speed/marker_data/remove/5

$attribute @s minecraft:submerged_mining_speed modifier remove cse.status_effects.submerged_mining_speed.$(id)