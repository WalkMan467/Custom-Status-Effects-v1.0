execute \
    as @e[sort=arbitrary,tag=cse.status_effect.jump_strength.data,distance=0..,type=marker] at @s \
    if score @s cse.status_effects.jump_strength.id = @n[sort=arbitrary,distance=0..,tag=cse.status.effect.clear,type=!#cse:dummy_mob] cse.status_effects.jump_strength.id run \
function cse:status_effects/apply/jump_strength/reset