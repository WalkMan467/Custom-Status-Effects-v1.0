scoreboard players reset @s cse.status_effects.armor_toughness
scoreboard players reset @s cse.status_effects.armor_toughness.base.value
scoreboard players reset @s cse.status_effects.armor_toughness.value.max
scoreboard players reset @s cse.status_effects.armor_toughness.value

function cse:status_effects/apply/armor_toughness/marker_data/remove/5

$attribute @s minecraft:armor_toughness modifier remove cse.status_effects.armor_toughness.$(id)