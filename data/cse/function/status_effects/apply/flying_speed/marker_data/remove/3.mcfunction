tag @s add cse.status_effect.flying_speed.data_target.reset
tag @s add cse.status_effect.flying_speed.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.flying_speed,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.flying_speed.id = @n[sort=arbitrary,tag=cse.status_effect.flying_speed.data_target.reset,tag=cse.status_effect.flying_speed.id.$(id),tag=cse.status_effect.flying_speed.data,distance=0..,type=marker] cse.status_effects.flying_speed.id run \
function cse:status_effects/apply/flying_speed/marker_data/remove/4 {id:"$(id)"}