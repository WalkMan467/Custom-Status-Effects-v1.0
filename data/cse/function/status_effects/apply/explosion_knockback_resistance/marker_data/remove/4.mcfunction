scoreboard players reset @s cse.status_effects.explosion_knockback_resistance
scoreboard players reset @s cse.status_effects.explosion_knockback_resistance.base.value
scoreboard players reset @s cse.status_effects.explosion_knockback_resistance.value.max
scoreboard players reset @s cse.status_effects.explosion_knockback_resistance.value

function cse:status_effects/apply/explosion_knockback_resistance/marker_data/remove/5

$attribute @s minecraft:explosion_knockback_resistance modifier remove cse.status_effects.explosion_knockback_resistance.$(id).$(type)