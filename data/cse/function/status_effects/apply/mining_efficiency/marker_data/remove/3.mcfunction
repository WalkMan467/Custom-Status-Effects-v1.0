tag @s add cse.status_effect.mining_efficiency.data_target.reset
tag @s add cse.status_effect.mining_efficiency.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.mining_efficiency,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.mining_efficiency.id = @n[sort=arbitrary,tag=cse.status_effect.mining_efficiency.data_target.reset,tag=cse.status_effect.mining_efficiency.id.$(id),tag=cse.status_effect.mining_efficiency.$(type),tag=cse.status_effect.mining_efficiency.data,distance=0..,type=marker] cse.status_effects.mining_efficiency.id run \
function cse:status_effects/apply/mining_efficiency/marker_data/remove/4 {id:"$(id)",type:"$(type)"}