tag @s add cse.status_effect.camera_distance.data_target.reset
tag @s add cse.status_effect.camera_distance.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.camera_distance,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.camera_distance.id = @n[sort=arbitrary,tag=cse.status_effect.camera_distance.data_target.reset,tag=cse.status_effect.camera_distance.id.$(id),tag=cse.status_effect.camera_distance.data,distance=0..,type=marker] cse.status_effects.camera_distance.id run \
function cse:status_effects/apply/camera_distance/marker_data/remove/4 {id:"$(id)"}