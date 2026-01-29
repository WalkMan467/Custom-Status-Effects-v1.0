tag @s add cse.status_effect.attack_damage.data_target.reset
tag @s add cse.status_effect.attack_damage.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.attack_damage,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.attack_damage.id = @n[sort=arbitrary,tag=cse.status_effect.attack_damage.data_target.reset,tag=cse.status_effect.attack_damage.id.$(id),tag=cse.status_effect.attack_damage.data,distance=0..,type=marker] cse.status_effects.attack_damage.id run \
function cse:status_effects/apply/attack_damage/marker_data/remove/4 {id:"$(id)"}