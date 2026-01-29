execute \
    as @e[sort=arbitrary,tag=cse.status_effect.max_health.data,distance=0..,type=marker] at @s \
    if score @s cse.status_effects.max_health.id = @n[sort=arbitrary,distance=0..,tag=cse.status.effect.clear,type=!#cse:dummy_mob] cse.status_effects.max_health.id run \
function cse:status_effects/apply/max_health/reset