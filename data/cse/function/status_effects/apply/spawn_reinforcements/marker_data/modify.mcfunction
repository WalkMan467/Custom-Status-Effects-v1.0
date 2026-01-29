tag @s add cse.status_effect.spawn_reinforcements.data_target
tag @s add cse.status_effect.spawn_reinforcements.user

execute \
    as @e[tag=cse.status_effect.spawn_reinforcements.data,distance=0..,type=marker] \
    if score @s cse.status_effects.spawn_reinforcements.id = @n[tag=cse.status_effect.spawn_reinforcements.user,tag=cse.status_effect.spawn_reinforcements.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.spawn_reinforcements.id run \
tag @s add cse.status_effect.spawn_reinforcements.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.spawn_reinforcements.id.$(id),tag=cse.status_effect.spawn_reinforcements.data_target,tag=cse.status_effect.spawn_reinforcements.data,distance=0..,type=marker] run \
function cse:status_effects/apply/spawn_reinforcements/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:spawn_reinforcements modifier remove cse.status_effects.spawn_reinforcements.$(id)
data modify storage cse:status_effects spawn_reinforcements.final_value.value set from entity @n[tag=cse.status_effect.spawn_reinforcements.data,tag=cse.status_effect.spawn_reinforcements.data_target,distance=0..,type=marker] data.cse.spawn_reinforcements.base_value

$data modify storage cse:status_effects spawn_reinforcements.final_value.id set value "$(id)"
function cse:status_effects/apply/spawn_reinforcements/marker_data/merge with storage cse:status_effects spawn_reinforcements.final_value

data remove storage cse:status_effects spawn_reinforcements

tag @s remove cse.status_effect.spawn_reinforcements.data_target
tag @s remove cse.status_effect.spawn_reinforcements.user

tag @e[sort=arbitrary,tag=cse.status_effect.spawn_reinforcements.data_target,tag=cse.status_effect.spawn_reinforcements.data,distance=0..,type=marker] remove cse.status_effect.spawn_reinforcements.data_target