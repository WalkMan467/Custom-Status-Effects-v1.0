scoreboard players reset @s cse.status_effects.safe_fall_distance
scoreboard players reset @s cse.status_effects.safe_fall_distance.base.value
scoreboard players reset @s cse.status_effects.safe_fall_distance.value.max
scoreboard players reset @s cse.status_effects.safe_fall_distance.value

function cse:status_effects/apply/safe_fall_distance/marker_data/remove/5

$attribute @s minecraft:safe_fall_distance modifier remove cse.status_effects.safe_fall_distance.$(id).$(type)