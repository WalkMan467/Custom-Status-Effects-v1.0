execute \
    as @e[sort=arbitrary,tag=cse.status_effect.movement_efficiency.data,distance=0..,type=marker] at @s \
    if score @s cse.status_effects.movement_efficiency.id = @n[sort=arbitrary,distance=0..,tag=cse.status.effect.clear,type=!#cse:dummy_mob] cse.status_effects.movement_efficiency.id run \
function cse:status_effects/apply/movement_efficiency/reset