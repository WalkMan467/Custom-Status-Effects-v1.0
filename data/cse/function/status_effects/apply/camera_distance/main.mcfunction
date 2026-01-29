execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.camera_distance.data,type=marker] at @s run \
function cse:status_effects/apply/camera_distance/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.camera_distance.data,type=marker] run \
schedule function cse:status_effects/apply/camera_distance/main 1t