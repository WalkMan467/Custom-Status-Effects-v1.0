execute \
    as @e[sort=arbitrary,tag=cse.status_effect.tempt_range.data,distance=0..,type=marker] at @s \
    if score @s cse.status_effects.tempt_range.id = @n[sort=arbitrary,distance=0..,tag=cse.status.effect.clear,type=!#cse:dummy_mob] cse.status_effects.tempt_range.id run \
function cse:status_effects/apply/tempt_range/reset