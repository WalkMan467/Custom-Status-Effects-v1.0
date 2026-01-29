scoreboard players reset @s cse.status_effects.spawn_reinforcements
scoreboard players reset @s cse.status_effects.spawn_reinforcements.base.value
scoreboard players reset @s cse.status_effects.spawn_reinforcements.value.max
scoreboard players reset @s cse.status_effects.spawn_reinforcements.value

function cse:status_effects/apply/spawn_reinforcements/marker_data/remove/5

$attribute @s minecraft:spawn_reinforcements modifier remove cse.status_effects.spawn_reinforcements.$(id)