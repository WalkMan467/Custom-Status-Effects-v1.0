tag @s add cse.status_effect.submerged_mining_speed.data_target.reset
tag @s add cse.status_effect.submerged_mining_speed.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.submerged_mining_speed,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.submerged_mining_speed.id = @n[sort=arbitrary,tag=cse.status_effect.submerged_mining_speed.data_target.reset,tag=cse.status_effect.submerged_mining_speed.id.$(id),tag=cse.status_effect.submerged_mining_speed.$(type),tag=cse.status_effect.submerged_mining_speed.data,distance=0..,type=marker] cse.status_effects.submerged_mining_speed.id run \
function cse:status_effects/apply/submerged_mining_speed/marker_data/remove/4 {id:"$(id)",type:"$(type)"}