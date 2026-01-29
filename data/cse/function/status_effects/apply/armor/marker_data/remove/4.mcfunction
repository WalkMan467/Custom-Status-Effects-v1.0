scoreboard players reset @s cse.status_effects.armor
scoreboard players reset @s cse.status_effects.armor.base.value
scoreboard players reset @s cse.status_effects.armor.value.max
scoreboard players reset @s cse.status_effects.armor.value

function cse:status_effects/apply/armor/marker_data/remove/5

$attribute @s minecraft:armor modifier remove cse.status_effects.armor.$(id)