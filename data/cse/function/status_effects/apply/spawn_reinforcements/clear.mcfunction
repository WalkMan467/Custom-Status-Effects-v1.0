execute \
    as @e[sort=arbitrary,tag=cse.status_effect.spawn_reinforcements.data,distance=0..,type=marker] at @s \
    if score @s cse.status_effects.spawn_reinforcements.id = @n[sort=arbitrary,distance=0..,tag=cse.status.effect.clear,type=!#cse:dummy_mob] cse.status_effects.spawn_reinforcements.id run \
function cse:status_effects/apply/spawn_reinforcements/reset