tag @s add cse.status_effect.jump_strength.data_target.reset
tag @s add cse.status_effect.jump_strength.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.jump_strength,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.jump_strength.id = @n[sort=arbitrary,tag=cse.status_effect.jump_strength.data_target.reset,tag=cse.status_effect.jump_strength.id.$(id),tag=cse.status_effect.jump_strength.data,distance=0..,type=marker] cse.status_effects.jump_strength.id run \
function cse:status_effects/apply/jump_strength/marker_data/remove/4 {id:"$(id)"}