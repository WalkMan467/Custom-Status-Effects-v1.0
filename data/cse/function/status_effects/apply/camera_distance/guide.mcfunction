
execute \
    if score @s cse.status_effects.camera_distance matches 1.. run \
function cse:status_effects/apply/camera_distance/timer

execute \
    if score @s cse.status_effects.camera_distance matches 0 run \
function cse:status_effects/apply/camera_distance/reset