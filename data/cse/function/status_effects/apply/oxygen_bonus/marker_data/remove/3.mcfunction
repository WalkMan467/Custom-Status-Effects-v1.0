tag @s add cse.status_effect.oxygen_bonus.data_target.reset
tag @s add cse.status_effect.oxygen_bonus.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.oxygen_bonus,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.oxygen_bonus.id = @n[sort=arbitrary,tag=cse.status_effect.oxygen_bonus.data_target.reset,tag=cse.status_effect.oxygen_bonus.id.$(id),tag=cse.status_effect.oxygen_bonus.$(type),tag=cse.status_effect.oxygen_bonus.data,distance=0..,type=marker] cse.status_effects.oxygen_bonus.id run \
function cse:status_effects/apply/oxygen_bonus/marker_data/remove/4 {id:"$(id)",type:"$(type)"}