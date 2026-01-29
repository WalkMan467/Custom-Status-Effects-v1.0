tag @s add cse.status_effect.burning_time.data_target
tag @s add cse.status_effect.burning_time.user

execute \
    as @e[tag=cse.status_effect.burning_time.data,distance=0..,type=marker] \
    if score @s cse.status_effects.burning_time.id = @n[tag=cse.status_effect.burning_time.user,tag=cse.status_effect.burning_time.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.burning_time.id run \
tag @s add cse.status_effect.burning_time.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.burning_time.id.$(id),tag=cse.status_effect.burning_time.data_target,tag=cse.status_effect.burning_time.data,distance=0..,type=marker] run \
function cse:status_effects/apply/burning_time/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:burning_time modifier remove cse.status_effects.burning_time.$(id)
data modify storage cse:status_effects burning_time.final_value.value set from entity @n[tag=cse.status_effect.burning_time.data,tag=cse.status_effect.burning_time.data_target,distance=0..,type=marker] data.cse.burning_time.base_value

$data modify storage cse:status_effects burning_time.final_value.id set value "$(id)"
function cse:status_effects/apply/burning_time/marker_data/merge with storage cse:status_effects burning_time.final_value

data remove storage cse:status_effects burning_time

tag @s remove cse.status_effect.burning_time.data_target
tag @s remove cse.status_effect.burning_time.user

tag @e[sort=arbitrary,tag=cse.status_effect.burning_time.data_target,tag=cse.status_effect.burning_time.data,distance=0..,type=marker] remove cse.status_effect.burning_time.data_target