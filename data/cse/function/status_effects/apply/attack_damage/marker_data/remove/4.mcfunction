scoreboard players reset @s cse.status_effects.attack_damage
scoreboard players reset @s cse.status_effects.attack_damage.base.value
scoreboard players reset @s cse.status_effects.attack_damage.value.max
scoreboard players reset @s cse.status_effects.attack_damage.value

function cse:status_effects/apply/attack_damage/marker_data/remove/5

$attribute @s minecraft:attack_damage modifier remove cse.status_effects.attack_damage.$(id)