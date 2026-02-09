scoreboard players reset @s cse.status_effects.mining_efficiency
scoreboard players reset @s cse.status_effects.mining_efficiency.base.value
scoreboard players reset @s cse.status_effects.mining_efficiency.value.max
scoreboard players reset @s cse.status_effects.mining_efficiency.value

function cse:status_effects/apply/mining_efficiency/marker_data/remove/5

$attribute @s minecraft:mining_efficiency modifier remove cse.status_effects.mining_efficiency.$(id).$(type)