tag @s add cse.status_effect.attack_knockback.data_target.reset
tag @s add cse.status_effect.attack_knockback.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.attack_knockback,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.attack_knockback.id = @n[sort=arbitrary,tag=cse.status_effect.attack_knockback.data_target.reset,tag=cse.status_effect.attack_knockback.id.$(id),tag=cse.status_effect.attack_knockback.data,distance=0..,type=marker] cse.status_effects.attack_knockback.id run \
function cse:status_effects/apply/attack_knockback/marker_data/remove/4 {id:"$(id)"}