# @s = Status Effects Marker

$data modify entity @s data.cse.attack_speed.add.value set value $(value)f
$data modify entity @s data.cse.attack_speed.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.attack_speed $(duration)

function cse:status_effects/apply/attack_speed/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.attack_speed.math run \
data get entity @s data.cse.attack_speed.add.value 1000

execute \
    store result score #base cse.status_effects.attack_speed.math run \
data get entity @s data.cse.attack_speed.base_value 1000

execute \
    store result score #max cse.status_effects.attack_speed.math run \
data get entity @s data.cse.attack_speed.max_value 1000

scoreboard players set $abs cse.status_effects.attack_speed.math -1
scoreboard players operation #base.abs cse.status_effects.attack_speed.math = #base cse.status_effects.attack_speed.math
scoreboard players operation #max.abs cse.status_effects.attack_speed.math = #max cse.status_effects.attack_speed.math

execute \
    if score #base cse.status_effects.attack_speed.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.attack_speed.math *= $abs cse.status_effects.attack_speed.math

execute \
    if score #max cse.status_effects.attack_speed.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.attack_speed.math *= $abs cse.status_effects.attack_speed.math

execute \
    if score #base.abs cse.status_effects.attack_speed.math < #max.abs cse.status_effects.attack_speed.math run \
scoreboard players operation #base cse.status_effects.attack_speed.math += #value cse.status_effects.attack_speed.math

execute \
    if score #base.abs cse.status_effects.attack_speed.math >= #max.abs cse.status_effects.attack_speed.math run \
scoreboard players operation #base cse.status_effects.attack_speed.math = #max cse.status_effects.attack_speed.math

execute \
    store result entity @s data.cse.attack_speed.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.attack_speed.math