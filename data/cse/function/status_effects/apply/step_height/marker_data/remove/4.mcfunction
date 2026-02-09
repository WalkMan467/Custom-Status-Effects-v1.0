scoreboard players reset @s cse.status_effects.step_height
scoreboard players reset @s cse.status_effects.step_height.base.value
scoreboard players reset @s cse.status_effects.step_height.value.max
scoreboard players reset @s cse.status_effects.step_height.value

function cse:status_effects/apply/step_height/marker_data/remove/5

$attribute @s minecraft:step_height modifier remove cse.status_effects.step_height.$(id).$(type)