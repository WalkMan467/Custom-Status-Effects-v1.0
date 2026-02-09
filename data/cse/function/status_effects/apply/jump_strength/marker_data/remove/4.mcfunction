scoreboard players reset @s cse.status_effects.jump_strength
scoreboard players reset @s cse.status_effects.jump_strength.base.value
scoreboard players reset @s cse.status_effects.jump_strength.value.max
scoreboard players reset @s cse.status_effects.jump_strength.value

function cse:status_effects/apply/jump_strength/marker_data/remove/5

$attribute @s minecraft:jump_strength modifier remove cse.status_effects.jump_strength.$(id).$(type)