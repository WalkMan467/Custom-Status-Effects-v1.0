# @s = Status Effects Marker

$data modify entity @s data.cse.attack_knockback.add.value set value $(value)f
$data modify entity @s data.cse.attack_knockback.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.attack_knockback $(duration)

function cse:status_effects/apply/attack_knockback/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.attack_knockback.math run \
data get entity @s data.cse.attack_knockback.add.value 1000

execute \
    store result score #base cse.status_effects.attack_knockback.math run \
data get entity @s data.cse.attack_knockback.base_value 1000

execute \
    store result score #max cse.status_effects.attack_knockback.math run \
data get entity @s data.cse.attack_knockback.max_value 1000

scoreboard players set $abs cse.status_effects.attack_knockback.math -1
scoreboard players operation #base.abs cse.status_effects.attack_knockback.math = #base cse.status_effects.attack_knockback.math
scoreboard players operation #max.abs cse.status_effects.attack_knockback.math = #max cse.status_effects.attack_knockback.math

execute \
    if score #base cse.status_effects.attack_knockback.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.attack_knockback.math *= $abs cse.status_effects.attack_knockback.math

execute \
    if score #max cse.status_effects.attack_knockback.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.attack_knockback.math *= $abs cse.status_effects.attack_knockback.math

execute \
    if score #base.abs cse.status_effects.attack_knockback.math < #max.abs cse.status_effects.attack_knockback.math run \
scoreboard players operation #base cse.status_effects.attack_knockback.math += #value cse.status_effects.attack_knockback.math

execute \
    if score #base.abs cse.status_effects.attack_knockback.math >= #max.abs cse.status_effects.attack_knockback.math run \
scoreboard players operation #base cse.status_effects.attack_knockback.math = #max cse.status_effects.attack_knockback.math

execute \
    store result entity @s data.cse.attack_knockback.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.attack_knockback.math