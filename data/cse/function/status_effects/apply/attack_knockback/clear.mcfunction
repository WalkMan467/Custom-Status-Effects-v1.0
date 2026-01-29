execute \
    as @e[sort=arbitrary,tag=cse.status_effect.attack_knockback.data,distance=0..,type=marker] at @s \
    if score @s cse.status_effects.attack_knockback.id = @n[sort=arbitrary,distance=0..,tag=cse.status.effect.clear,type=!#cse:dummy_mob] cse.status_effects.attack_knockback.id run \
function cse:status_effects/apply/attack_knockback/reset