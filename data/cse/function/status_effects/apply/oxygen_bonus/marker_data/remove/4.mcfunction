scoreboard players reset @s cse.status_effects.oxygen_bonus
scoreboard players reset @s cse.status_effects.oxygen_bonus.base.value
scoreboard players reset @s cse.status_effects.oxygen_bonus.value.max
scoreboard players reset @s cse.status_effects.oxygen_bonus.value

function cse:status_effects/apply/oxygen_bonus/marker_data/remove/5

$attribute @s minecraft:oxygen_bonus modifier remove cse.status_effects.oxygen_bonus.$(id)