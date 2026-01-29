tag @s add cse.status_effect.flying_speed.data_target
tag @s add cse.status_effect.flying_speed.user

execute \
    as @e[tag=cse.status_effect.flying_speed.data,distance=0..,type=marker] \
    if score @s cse.status_effects.flying_speed.id = @n[tag=cse.status_effect.flying_speed.user,tag=cse.status_effect.flying_speed.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.flying_speed.id run \
tag @s add cse.status_effect.flying_speed.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.flying_speed.id.$(id),tag=cse.status_effect.flying_speed.data_target,tag=cse.status_effect.flying_speed.data,distance=0..,type=marker] run \
function cse:status_effects/apply/flying_speed/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:flying_speed modifier remove cse.status_effects.flying_speed.$(id)
data modify storage cse:status_effects flying_speed.final_value.value set from entity @n[tag=cse.status_effect.flying_speed.data,tag=cse.status_effect.flying_speed.data_target,distance=0..,type=marker] data.cse.flying_speed.base_value

$data modify storage cse:status_effects flying_speed.final_value.id set value "$(id)"
function cse:status_effects/apply/flying_speed/marker_data/merge with storage cse:status_effects flying_speed.final_value

data remove storage cse:status_effects flying_speed

tag @s remove cse.status_effect.flying_speed.data_target
tag @s remove cse.status_effect.flying_speed.user

tag @e[sort=arbitrary,tag=cse.status_effect.flying_speed.data_target,tag=cse.status_effect.flying_speed.data,distance=0..,type=marker] remove cse.status_effect.flying_speed.data_target