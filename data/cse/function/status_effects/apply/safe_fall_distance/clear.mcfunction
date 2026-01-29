execute \
    as @e[sort=arbitrary,tag=cse.status_effect.safe_fall_distance.data,distance=0..,type=marker] at @s \
    if score @s cse.status_effects.safe_fall_distance.id = @n[sort=arbitrary,distance=0..,tag=cse.status.effect.clear,type=!#cse:dummy_mob] cse.status_effects.safe_fall_distance.id run \
function cse:status_effects/apply/safe_fall_distance/reset