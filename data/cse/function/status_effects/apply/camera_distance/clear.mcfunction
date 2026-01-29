execute \
    as @e[sort=arbitrary,tag=cse.status_effect.camera_distance.data,distance=0..,type=marker] at @s \
    if score @s cse.status_effects.camera_distance.id = @n[sort=arbitrary,distance=0..,tag=cse.status.effect.clear,type=!#cse:dummy_mob] cse.status_effects.camera_distance.id run \
function cse:status_effects/apply/camera_distance/reset