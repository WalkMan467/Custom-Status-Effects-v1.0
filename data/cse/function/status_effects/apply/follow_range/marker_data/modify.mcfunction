tag @s add cse.status_effect.follow_range.data_target
tag @s add cse.status_effect.follow_range.user

execute \
    as @e[tag=cse.status_effect.follow_range.data,distance=0..,type=marker] \
    if score @s cse.status_effects.follow_range.id = @n[tag=cse.status_effect.follow_range.user,tag=cse.status_effect.follow_range.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.follow_range.id run \
tag @s add cse.status_effect.follow_range.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.follow_range.id.$(id),tag=cse.status_effect.follow_range.data_target,tag=cse.status_effect.follow_range.data,distance=0..,type=marker] run \
function cse:status_effects/apply/follow_range/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:follow_range modifier remove cse.status_effects.follow_range.$(id)
data modify storage cse:status_effects follow_range.final_value.value set from entity @n[tag=cse.status_effect.follow_range.data,tag=cse.status_effect.follow_range.data_target,distance=0..,type=marker] data.cse.follow_range.base_value

$data modify storage cse:status_effects follow_range.final_value.id set value "$(id)"
function cse:status_effects/apply/follow_range/marker_data/merge with storage cse:status_effects follow_range.final_value

data remove storage cse:status_effects follow_range

tag @s remove cse.status_effect.follow_range.data_target
tag @s remove cse.status_effect.follow_range.user

tag @e[sort=arbitrary,tag=cse.status_effect.follow_range.data_target,tag=cse.status_effect.follow_range.data,distance=0..,type=marker] remove cse.status_effect.follow_range.data_target