scoreboard players reset @s cse.status_effects.attack_knockback
scoreboard players reset @s cse.status_effects.attack_knockback.base.value
scoreboard players reset @s cse.status_effects.attack_knockback.value.max
scoreboard players reset @s cse.status_effects.attack_knockback.value

function cse:status_effects/apply/attack_knockback/marker_data/remove/5

$attribute @s minecraft:attack_knockback modifier remove cse.status_effects.attack_knockback.$(id).$(type)