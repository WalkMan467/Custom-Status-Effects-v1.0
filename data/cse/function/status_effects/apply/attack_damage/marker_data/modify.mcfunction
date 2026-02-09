tag @s add cse.status_effect.attack_damage.data_target
tag @s add cse.status_effect.attack_damage.user

execute \
    as @e[tag=cse.status_effect.attack_damage.data,distance=0..,type=marker] \
    if score @s cse.status_effects.attack_damage.id = @n[tag=cse.status_effect.attack_damage.user,tag=cse.status_effect.attack_damage.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.attack_damage.id run \
tag @s add cse.status_effect.attack_damage.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.attack_damage.id.$(id),tag=cse.status_effect.attack_damage.$(type),tag=cse.status_effect.attack_damage.data_target,tag=cse.status_effect.attack_damage.data,distance=0..,type=marker] run \
function cse:status_effects/apply/attack_damage/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:attack_damage modifier remove cse.status_effects.attack_damage.$(id).$(type)
data modify storage cse:status_effects attack_damage.final_value.value set from entity @n[tag=cse.status_effect.attack_damage.data,tag=cse.status_effect.attack_damage.data_target,distance=0..,type=marker] data.cse.attack_damage.base_value
$data modify storage cse:status_effects attack_damage.final_value.type set value "$(type)"
$data modify storage cse:status_effects attack_damage.final_value.id set value "$(id)"
function cse:status_effects/apply/attack_damage/marker_data/merge with storage cse:status_effects attack_damage.final_value

data modify storage temp2 temp set from storage cse:status_effects attack_damage.final_value
data remove storage cse:status_effects attack_damage

tag @s remove cse.status_effect.attack_damage.data_target
tag @s remove cse.status_effect.attack_damage.user

tag @e[sort=arbitrary,tag=cse.status_effect.attack_damage.data_target,tag=cse.status_effect.attack_damage.data,distance=0..,type=marker] remove cse.status_effect.attack_damage.data_target