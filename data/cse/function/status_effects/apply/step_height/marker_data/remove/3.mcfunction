tag @s add cse.status_effect.step_height.data_target.reset
tag @s add cse.status_effect.step_height.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.step_height,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.step_height.id = @n[sort=arbitrary,tag=cse.status_effect.step_height.data_target.reset,tag=cse.status_effect.step_height.id.$(id),tag=cse.status_effect.step_height.data,distance=0..,type=marker] cse.status_effects.step_height.id run \
function cse:status_effects/apply/step_height/marker_data/remove/4 {id:"$(id)"}