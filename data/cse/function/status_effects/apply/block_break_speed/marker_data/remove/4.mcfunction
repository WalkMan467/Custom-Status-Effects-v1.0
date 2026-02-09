scoreboard players reset @s cse.status_effects.block_break_speed
scoreboard players reset @s cse.status_effects.block_break_speed.base.value
scoreboard players reset @s cse.status_effects.block_break_speed.value.max
scoreboard players reset @s cse.status_effects.block_break_speed.value

function cse:status_effects/apply/block_break_speed/marker_data/remove/5

$attribute @s minecraft:block_break_speed modifier remove cse.status_effects.block_break_speed.$(id).$(type)