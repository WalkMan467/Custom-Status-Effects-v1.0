tag @s add cse.status_effect.camera_distance.data_target
tag @s add cse.status_effect.camera_distance.user

execute \
    as @e[tag=cse.status_effect.camera_distance.data,distance=0..,type=marker] \
    if score @s cse.status_effects.camera_distance.id = @n[tag=cse.status_effect.camera_distance.user,tag=cse.status_effect.camera_distance.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.camera_distance.id run \
tag @s add cse.status_effect.camera_distance.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.camera_distance.id.$(id),tag=cse.status_effect.camera_distance.$(type),tag=cse.status_effect.camera_distance.data_target,tag=cse.status_effect.camera_distance.data,distance=0..,type=marker] run \
function cse:status_effects/apply/camera_distance/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:camera_distance modifier remove cse.status_effects.camera_distance.$(id).$(type)
data modify storage cse:status_effects camera_distance.final_value.value set from entity @n[tag=cse.status_effect.camera_distance.data,tag=cse.status_effect.camera_distance.data_target,distance=0..,type=marker] data.cse.camera_distance.base_value
$data modify storage cse:status_effects camera_distance.final_value.type set value "$(type)"
$data modify storage cse:status_effects camera_distance.final_value.id set value "$(id)"
function cse:status_effects/apply/camera_distance/marker_data/merge with storage cse:status_effects camera_distance.final_value

data modify storage temp2 temp set from storage cse:status_effects camera_distance.final_value
data remove storage cse:status_effects camera_distance

tag @s remove cse.status_effect.camera_distance.data_target
tag @s remove cse.status_effect.camera_distance.user

tag @e[sort=arbitrary,tag=cse.status_effect.camera_distance.data_target,tag=cse.status_effect.camera_distance.data,distance=0..,type=marker] remove cse.status_effect.camera_distance.data_target