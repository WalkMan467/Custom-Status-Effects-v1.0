tag @s add cse.status_effect.luck.data_target.reset
tag @s add cse.status_effect.luck.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.luck,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.luck.id = @n[sort=arbitrary,tag=cse.status_effect.luck.data_target.reset,tag=cse.status_effect.luck.id.$(id),tag=cse.status_effect.luck.$(type),tag=cse.status_effect.luck.data,distance=0..,type=marker] cse.status_effects.luck.id run \
function cse:status_effects/apply/luck/marker_data/remove/4 {id:"$(id)",type:"$(type)"}