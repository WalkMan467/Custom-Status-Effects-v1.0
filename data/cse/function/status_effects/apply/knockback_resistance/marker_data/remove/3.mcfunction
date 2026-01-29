tag @s add cse.status_effect.knockback_resistance.data_target.reset
tag @s add cse.status_effect.knockback_resistance.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.knockback_resistance,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.knockback_resistance.id = @n[sort=arbitrary,tag=cse.status_effect.knockback_resistance.data_target.reset,tag=cse.status_effect.knockback_resistance.id.$(id),tag=cse.status_effect.knockback_resistance.data,distance=0..,type=marker] cse.status_effects.knockback_resistance.id run \
function cse:status_effects/apply/knockback_resistance/marker_data/remove/4 {id:"$(id)"}