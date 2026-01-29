scoreboard players reset @s cse.status_effects.follow_range
scoreboard players reset @s cse.status_effects.follow_range.base.value
scoreboard players reset @s cse.status_effects.follow_range.value.max
scoreboard players reset @s cse.status_effects.follow_range.value

function cse:status_effects/apply/follow_range/marker_data/remove/5

$attribute @s minecraft:follow_range modifier remove cse.status_effects.follow_range.$(id)