tag @s add cse.status_effect.max_health.data_target
tag @s add cse.status_effect.max_health.user

execute \
    as @e[tag=cse.status_effect.max_health.data,distance=0..,type=marker] \
    if score @s cse.status_effects.max_health.id = @n[tag=cse.status_effect.max_health.user,tag=cse.status_effect.max_health.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.max_health.id run \
tag @s add cse.status_effect.max_health.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.max_health.id.$(id),tag=cse.status_effect.max_health.data_target,tag=cse.status_effect.max_health.data,distance=0..,type=marker] run \
function cse:status_effects/apply/max_health/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:max_health modifier remove cse.status_effects.max_health.$(id)
data modify storage cse:status_effects max_health.final_value.value set from entity @n[tag=cse.status_effect.max_health.data,tag=cse.status_effect.max_health.data_target,distance=0..,type=marker] data.cse.max_health.base_value

$data modify storage cse:status_effects max_health.final_value.id set value "$(id)"
function cse:status_effects/apply/max_health/marker_data/merge with storage cse:status_effects max_health.final_value

data remove storage cse:status_effects max_health

tag @s remove cse.status_effect.max_health.data_target
tag @s remove cse.status_effect.max_health.user

tag @e[sort=arbitrary,tag=cse.status_effect.max_health.data_target,tag=cse.status_effect.max_health.data,distance=0..,type=marker] remove cse.status_effect.max_health.data_target