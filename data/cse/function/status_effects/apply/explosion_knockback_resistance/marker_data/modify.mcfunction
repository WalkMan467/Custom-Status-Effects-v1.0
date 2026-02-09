tag @s add cse.status_effect.explosion_knockback_resistance.data_target
tag @s add cse.status_effect.explosion_knockback_resistance.user

execute \
    as @e[tag=cse.status_effect.explosion_knockback_resistance.data,distance=0..,type=marker] \
    if score @s cse.status_effects.explosion_knockback_resistance.id = @n[tag=cse.status_effect.explosion_knockback_resistance.user,tag=cse.status_effect.explosion_knockback_resistance.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.explosion_knockback_resistance.id run \
tag @s add cse.status_effect.explosion_knockback_resistance.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.explosion_knockback_resistance.id.$(id),tag=cse.status_effect.explosion_knockback_resistance.$(type),tag=cse.status_effect.explosion_knockback_resistance.data_target,tag=cse.status_effect.explosion_knockback_resistance.data,distance=0..,type=marker] run \
function cse:status_effects/apply/explosion_knockback_resistance/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:explosion_knockback_resistance modifier remove cse.status_effects.explosion_knockback_resistance.$(id).$(type)
data modify storage cse:status_effects explosion_knockback_resistance.final_value.value set from entity @n[tag=cse.status_effect.explosion_knockback_resistance.data,tag=cse.status_effect.explosion_knockback_resistance.data_target,distance=0..,type=marker] data.cse.explosion_knockback_resistance.base_value
$data modify storage cse:status_effects explosion_knockback_resistance.final_value.type set value "$(type)"
$data modify storage cse:status_effects explosion_knockback_resistance.final_value.id set value "$(id)"
function cse:status_effects/apply/explosion_knockback_resistance/marker_data/merge with storage cse:status_effects explosion_knockback_resistance.final_value

data modify storage temp2 temp set from storage cse:status_effects explosion_knockback_resistance.final_value
data remove storage cse:status_effects explosion_knockback_resistance

tag @s remove cse.status_effect.explosion_knockback_resistance.data_target
tag @s remove cse.status_effect.explosion_knockback_resistance.user

tag @e[sort=arbitrary,tag=cse.status_effect.explosion_knockback_resistance.data_target,tag=cse.status_effect.explosion_knockback_resistance.data,distance=0..,type=marker] remove cse.status_effect.explosion_knockback_resistance.data_target