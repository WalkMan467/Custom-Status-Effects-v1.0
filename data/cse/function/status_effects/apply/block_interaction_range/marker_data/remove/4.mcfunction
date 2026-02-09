scoreboard players reset @s cse.status_effects.block_interaction_range
scoreboard players reset @s cse.status_effects.block_interaction_range.base.value
scoreboard players reset @s cse.status_effects.block_interaction_range.value.max
scoreboard players reset @s cse.status_effects.block_interaction_range.value

function cse:status_effects/apply/block_interaction_range/marker_data/remove/5

$attribute @s minecraft:block_interaction_range modifier remove cse.status_effects.block_interaction_range.$(id).$(type)