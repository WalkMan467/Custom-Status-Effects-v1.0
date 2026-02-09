tag @s add cse.status_effect.spawn_reinforcements.data_target.reset
tag @s add cse.status_effect.spawn_reinforcements.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.spawn_reinforcements,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.spawn_reinforcements.id = @n[sort=arbitrary,tag=cse.status_effect.spawn_reinforcements.data_target.reset,tag=cse.status_effect.spawn_reinforcements.id.$(id),tag=cse.status_effect.spawn_reinforcements.$(type),tag=cse.status_effect.spawn_reinforcements.data,distance=0..,type=marker] cse.status_effects.spawn_reinforcements.id run \
function cse:status_effects/apply/spawn_reinforcements/marker_data/remove/4 {id:"$(id)",type:"$(type)"}