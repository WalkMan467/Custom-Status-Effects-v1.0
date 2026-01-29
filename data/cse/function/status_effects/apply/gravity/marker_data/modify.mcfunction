tag @s add cse.status_effect.gravity.data_target
tag @s add cse.status_effect.gravity.user

execute \
    as @e[tag=cse.status_effect.gravity.data,distance=0..,type=marker] \
    if score @s cse.status_effects.gravity.id = @n[tag=cse.status_effect.gravity.user,tag=cse.status_effect.gravity.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.gravity.id run \
tag @s add cse.status_effect.gravity.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.gravity.id.$(id),tag=cse.status_effect.gravity.data_target,tag=cse.status_effect.gravity.data,distance=0..,type=marker] run \
function cse:status_effects/apply/gravity/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:gravity modifier remove cse.status_effects.gravity.$(id)
data modify storage cse:status_effects gravity.final_value.value set from entity @n[tag=cse.status_effect.gravity.data,tag=cse.status_effect.gravity.data_target,distance=0..,type=marker] data.cse.gravity.base_value

$data modify storage cse:status_effects gravity.final_value.id set value "$(id)"
function cse:status_effects/apply/gravity/marker_data/merge with storage cse:status_effects gravity.final_value

data remove storage cse:status_effects gravity

tag @s remove cse.status_effect.gravity.data_target
tag @s remove cse.status_effect.gravity.user

tag @e[sort=arbitrary,tag=cse.status_effect.gravity.data_target,tag=cse.status_effect.gravity.data,distance=0..,type=marker] remove cse.status_effect.gravity.data_target