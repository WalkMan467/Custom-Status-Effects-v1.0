scoreboard players reset @s cse.status_effects.luck
scoreboard players reset @s cse.status_effects.luck.base.value
scoreboard players reset @s cse.status_effects.luck.value.max
scoreboard players reset @s cse.status_effects.luck.value

function cse:status_effects/apply/luck/marker_data/remove/5

$attribute @s minecraft:luck modifier remove cse.status_effects.luck.$(id).$(type)