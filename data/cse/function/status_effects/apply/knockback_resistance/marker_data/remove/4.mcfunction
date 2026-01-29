scoreboard players reset @s cse.status_effects.knockback_resistance
scoreboard players reset @s cse.status_effects.knockback_resistance.base.value
scoreboard players reset @s cse.status_effects.knockback_resistance.value.max
scoreboard players reset @s cse.status_effects.knockback_resistance.value

function cse:status_effects/apply/knockback_resistance/marker_data/remove/5

$attribute @s minecraft:knockback_resistance modifier remove cse.status_effects.knockback_resistance.$(id)