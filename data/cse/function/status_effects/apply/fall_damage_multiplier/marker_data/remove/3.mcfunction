tag @s add cse.status_effect.fall_damage_multiplier.data_target.reset
tag @s add cse.status_effect.fall_damage_multiplier.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.fall_damage_multiplier,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.fall_damage_multiplier.id = @n[sort=arbitrary,tag=cse.status_effect.fall_damage_multiplier.data_target.reset,tag=cse.status_effect.fall_damage_multiplier.id.$(id),tag=cse.status_effect.fall_damage_multiplier.$(type),tag=cse.status_effect.fall_damage_multiplier.data,distance=0..,type=marker] cse.status_effects.fall_damage_multiplier.id run \
function cse:status_effects/apply/fall_damage_multiplier/marker_data/remove/4 {id:"$(id)",type:"$(type)"}