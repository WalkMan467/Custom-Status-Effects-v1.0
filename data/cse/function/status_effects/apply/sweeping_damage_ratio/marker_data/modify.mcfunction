tag @s add cse.status_effect.sweeping_damage_ratio.data_target
tag @s add cse.status_effect.sweeping_damage_ratio.user

execute \
    as @e[tag=cse.status_effect.sweeping_damage_ratio.data,distance=0..,type=marker] \
    if score @s cse.status_effects.sweeping_damage_ratio.id = @n[tag=cse.status_effect.sweeping_damage_ratio.user,tag=cse.status_effect.sweeping_damage_ratio.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.sweeping_damage_ratio.id run \
tag @s add cse.status_effect.sweeping_damage_ratio.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.sweeping_damage_ratio.id.$(id),tag=cse.status_effect.sweeping_damage_ratio.data_target,tag=cse.status_effect.sweeping_damage_ratio.data,distance=0..,type=marker] run \
function cse:status_effects/apply/sweeping_damage_ratio/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:sweeping_damage_ratio modifier remove cse.status_effects.sweeping_damage_ratio.$(id)
data modify storage cse:status_effects sweeping_damage_ratio.final_value.value set from entity @n[tag=cse.status_effect.sweeping_damage_ratio.data,tag=cse.status_effect.sweeping_damage_ratio.data_target,distance=0..,type=marker] data.cse.sweeping_damage_ratio.base_value

$data modify storage cse:status_effects sweeping_damage_ratio.final_value.id set value "$(id)"
function cse:status_effects/apply/sweeping_damage_ratio/marker_data/merge with storage cse:status_effects sweeping_damage_ratio.final_value

data remove storage cse:status_effects sweeping_damage_ratio

tag @s remove cse.status_effect.sweeping_damage_ratio.data_target
tag @s remove cse.status_effect.sweeping_damage_ratio.user

tag @e[sort=arbitrary,tag=cse.status_effect.sweeping_damage_ratio.data_target,tag=cse.status_effect.sweeping_damage_ratio.data,distance=0..,type=marker] remove cse.status_effect.sweeping_damage_ratio.data_target