tag @s add cse.status_effect.step_height.data_target
tag @s add cse.status_effect.step_height.user

execute \
    as @e[tag=cse.status_effect.step_height.data,distance=0..,type=marker] \
    if score @s cse.status_effects.step_height.id = @n[tag=cse.status_effect.step_height.user,tag=cse.status_effect.step_height.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.step_height.id run \
tag @s add cse.status_effect.step_height.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.step_height.id.$(id),tag=cse.status_effect.step_height.$(type),tag=cse.status_effect.step_height.data_target,tag=cse.status_effect.step_height.data,distance=0..,type=marker] run \
function cse:status_effects/apply/step_height/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:step_height modifier remove cse.status_effects.step_height.$(id).$(type)
data modify storage cse:status_effects step_height.final_value.value set from entity @n[tag=cse.status_effect.step_height.data,tag=cse.status_effect.step_height.data_target,distance=0..,type=marker] data.cse.step_height.base_value
$data modify storage cse:status_effects step_height.final_value.type set value "$(type)"
$data modify storage cse:status_effects step_height.final_value.id set value "$(id)"
function cse:status_effects/apply/step_height/marker_data/merge with storage cse:status_effects step_height.final_value

data modify storage temp2 temp set from storage cse:status_effects step_height.final_value
data remove storage cse:status_effects step_height

tag @s remove cse.status_effect.step_height.data_target
tag @s remove cse.status_effect.step_height.user

tag @e[sort=arbitrary,tag=cse.status_effect.step_height.data_target,tag=cse.status_effect.step_height.data,distance=0..,type=marker] remove cse.status_effect.step_height.data_target