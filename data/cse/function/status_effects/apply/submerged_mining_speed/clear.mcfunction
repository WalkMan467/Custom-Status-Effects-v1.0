execute \
    as @e[sort=arbitrary,tag=cse.status_effect.submerged_mining_speed.data,distance=0..,type=marker] at @s \
    if score @s cse.status_effects.submerged_mining_speed.id = @n[sort=arbitrary,distance=0..,tag=cse.status.effect.clear,type=!#cse:dummy_mob] cse.status_effects.submerged_mining_speed.id run \
function cse:status_effects/apply/submerged_mining_speed/reset