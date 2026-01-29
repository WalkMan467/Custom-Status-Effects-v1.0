execute \
    as @e[sort=arbitrary,tag=cse.status_effect.burning_time.data,distance=0..,type=marker] at @s \
    if score @s cse.status_effects.burning_time.id = @n[sort=arbitrary,distance=0..,tag=cse.status.effect.clear,type=!#cse:dummy_mob] cse.status_effects.burning_time.id run \
function cse:status_effects/apply/burning_time/reset