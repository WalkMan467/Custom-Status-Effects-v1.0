tag @s add cse.status_effect.sweeping_damage_ratio.data_target.reset
tag @s add cse.status_effect.sweeping_damage_ratio.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.sweeping_damage_ratio,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.sweeping_damage_ratio.id = @n[sort=arbitrary,tag=cse.status_effect.sweeping_damage_ratio.data_target.reset,tag=cse.status_effect.sweeping_damage_ratio.id.$(id),tag=cse.status_effect.sweeping_damage_ratio.data,distance=0..,type=marker] cse.status_effects.sweeping_damage_ratio.id run \
function cse:status_effects/apply/sweeping_damage_ratio/marker_data/remove/4 {id:"$(id)"}