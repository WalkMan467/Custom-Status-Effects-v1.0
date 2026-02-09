scoreboard players reset @s cse.status_effects.tempt_range
scoreboard players reset @s cse.status_effects.tempt_range.base.value
scoreboard players reset @s cse.status_effects.tempt_range.value.max
scoreboard players reset @s cse.status_effects.tempt_range.value

function cse:status_effects/apply/tempt_range/marker_data/remove/5

$attribute @s minecraft:tempt_range modifier remove cse.status_effects.tempt_range.$(id).$(type)