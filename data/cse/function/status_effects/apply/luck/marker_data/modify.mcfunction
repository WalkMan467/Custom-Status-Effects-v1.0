tag @s add cse.status_effect.luck.data_target
tag @s add cse.status_effect.luck.user

execute \
    as @e[tag=cse.status_effect.luck.data,distance=0..,type=marker] \
    if score @s cse.status_effects.luck.id = @n[tag=cse.status_effect.luck.user,tag=cse.status_effect.luck.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.luck.id run \
tag @s add cse.status_effect.luck.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.luck.id.$(id),tag=cse.status_effect.luck.$(type),tag=cse.status_effect.luck.data_target,tag=cse.status_effect.luck.data,distance=0..,type=marker] run \
function cse:status_effects/apply/luck/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:luck modifier remove cse.status_effects.luck.$(id).$(type)
data modify storage cse:status_effects luck.final_value.value set from entity @n[tag=cse.status_effect.luck.data,tag=cse.status_effect.luck.data_target,distance=0..,type=marker] data.cse.luck.base_value
$data modify storage cse:status_effects luck.final_value.type set value "$(type)"
$data modify storage cse:status_effects luck.final_value.id set value "$(id)"
function cse:status_effects/apply/luck/marker_data/merge with storage cse:status_effects luck.final_value

data modify storage temp2 temp set from storage cse:status_effects luck.final_value
data remove storage cse:status_effects luck

tag @s remove cse.status_effect.luck.data_target
tag @s remove cse.status_effect.luck.user

tag @e[sort=arbitrary,tag=cse.status_effect.luck.data_target,tag=cse.status_effect.luck.data,distance=0..,type=marker] remove cse.status_effect.luck.data_target