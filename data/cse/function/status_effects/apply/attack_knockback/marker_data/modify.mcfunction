tag @s add cse.status_effect.attack_knockback.data_target
tag @s add cse.status_effect.attack_knockback.user

execute \
    as @e[tag=cse.status_effect.attack_knockback.data,distance=0..,type=marker] \
    if score @s cse.status_effects.attack_knockback.id = @n[tag=cse.status_effect.attack_knockback.user,tag=cse.status_effect.attack_knockback.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.attack_knockback.id run \
tag @s add cse.status_effect.attack_knockback.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.attack_knockback.id.$(id),tag=cse.status_effect.attack_knockback.data_target,tag=cse.status_effect.attack_knockback.data,distance=0..,type=marker] run \
function cse:status_effects/apply/attack_knockback/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:attack_knockback modifier remove cse.status_effects.attack_knockback.$(id)
data modify storage cse:status_effects attack_knockback.final_value.value set from entity @n[tag=cse.status_effect.attack_knockback.data,tag=cse.status_effect.attack_knockback.data_target,distance=0..,type=marker] data.cse.attack_knockback.base_value

$data modify storage cse:status_effects attack_knockback.final_value.id set value "$(id)"
function cse:status_effects/apply/attack_knockback/marker_data/merge with storage cse:status_effects attack_knockback.final_value

data remove storage cse:status_effects attack_knockback

tag @s remove cse.status_effect.attack_knockback.data_target
tag @s remove cse.status_effect.attack_knockback.user

tag @e[sort=arbitrary,tag=cse.status_effect.attack_knockback.data_target,tag=cse.status_effect.attack_knockback.data,distance=0..,type=marker] remove cse.status_effect.attack_knockback.data_target