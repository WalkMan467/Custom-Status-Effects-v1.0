tag @s add cse.status_effect.oxygen_bonus.data_target
tag @s add cse.status_effect.oxygen_bonus.user

execute \
    as @e[tag=cse.status_effect.oxygen_bonus.data,distance=0..,type=marker] \
    if score @s cse.status_effects.oxygen_bonus.id = @n[tag=cse.status_effect.oxygen_bonus.user,tag=cse.status_effect.oxygen_bonus.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.oxygen_bonus.id run \
tag @s add cse.status_effect.oxygen_bonus.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.oxygen_bonus.id.$(id),tag=cse.status_effect.oxygen_bonus.$(type),tag=cse.status_effect.oxygen_bonus.data_target,tag=cse.status_effect.oxygen_bonus.data,distance=0..,type=marker] run \
function cse:status_effects/apply/oxygen_bonus/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:oxygen_bonus modifier remove cse.status_effects.oxygen_bonus.$(id).$(type)
data modify storage cse:status_effects oxygen_bonus.final_value.value set from entity @n[tag=cse.status_effect.oxygen_bonus.data,tag=cse.status_effect.oxygen_bonus.data_target,distance=0..,type=marker] data.cse.oxygen_bonus.base_value
$data modify storage cse:status_effects oxygen_bonus.final_value.type set value "$(type)"
$data modify storage cse:status_effects oxygen_bonus.final_value.id set value "$(id)"
function cse:status_effects/apply/oxygen_bonus/marker_data/merge with storage cse:status_effects oxygen_bonus.final_value

data modify storage temp2 temp set from storage cse:status_effects oxygen_bonus.final_value
data remove storage cse:status_effects oxygen_bonus

tag @s remove cse.status_effect.oxygen_bonus.data_target
tag @s remove cse.status_effect.oxygen_bonus.user

tag @e[sort=arbitrary,tag=cse.status_effect.oxygen_bonus.data_target,tag=cse.status_effect.oxygen_bonus.data,distance=0..,type=marker] remove cse.status_effect.oxygen_bonus.data_target