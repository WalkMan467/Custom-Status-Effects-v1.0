tag @s add cse.status_effect.mining_efficiency.data_target
tag @s add cse.status_effect.mining_efficiency.user

execute \
    as @e[tag=cse.status_effect.mining_efficiency.data,distance=0..,type=marker] \
    if score @s cse.status_effects.mining_efficiency.id = @n[tag=cse.status_effect.mining_efficiency.user,tag=cse.status_effect.mining_efficiency.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.mining_efficiency.id run \
tag @s add cse.status_effect.mining_efficiency.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.mining_efficiency.id.$(id),tag=cse.status_effect.mining_efficiency.$(type),tag=cse.status_effect.mining_efficiency.data_target,tag=cse.status_effect.mining_efficiency.data,distance=0..,type=marker] run \
function cse:status_effects/apply/mining_efficiency/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:mining_efficiency modifier remove cse.status_effects.mining_efficiency.$(id).$(type)
data modify storage cse:status_effects mining_efficiency.final_value.value set from entity @n[tag=cse.status_effect.mining_efficiency.data,tag=cse.status_effect.mining_efficiency.data_target,distance=0..,type=marker] data.cse.mining_efficiency.base_value
$data modify storage cse:status_effects mining_efficiency.final_value.type set value "$(type)"
$data modify storage cse:status_effects mining_efficiency.final_value.id set value "$(id)"
function cse:status_effects/apply/mining_efficiency/marker_data/merge with storage cse:status_effects mining_efficiency.final_value

data modify storage temp2 temp set from storage cse:status_effects mining_efficiency.final_value
data remove storage cse:status_effects mining_efficiency

tag @s remove cse.status_effect.mining_efficiency.data_target
tag @s remove cse.status_effect.mining_efficiency.user

tag @e[sort=arbitrary,tag=cse.status_effect.mining_efficiency.data_target,tag=cse.status_effect.mining_efficiency.data,distance=0..,type=marker] remove cse.status_effect.mining_efficiency.data_target