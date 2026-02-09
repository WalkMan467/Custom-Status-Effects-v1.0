# @s = Status Effects Marker

$data modify entity @s data.cse.attack_damage.add.value set value $(value)f
$data modify entity @s data.cse.attack_damage.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.attack_damage $(duration)

function cse:status_effects/apply/attack_damage/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.attack_damage.math run \
data get entity @s data.cse.attack_damage.add.value 1000

execute \
    store result score #base cse.status_effects.attack_damage.math run \
data get entity @s data.cse.attack_damage.base_value 1000

execute \
    store result score #max cse.status_effects.attack_damage.math run \
data get entity @s data.cse.attack_damage.max_value 1000

scoreboard players set #abs cse.global.main -1

scoreboard players set $abs cse.status_effects.attack_damage.math -1
scoreboard players operation #base.abs cse.status_effects.attack_damage.math = #base cse.status_effects.attack_damage.math
scoreboard players operation #max.abs cse.status_effects.attack_damage.math = #max cse.status_effects.attack_damage.math

execute \
    if score #base cse.status_effects.attack_damage.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.attack_damage.math *= $abs cse.status_effects.attack_damage.math

execute \
    if score #max cse.status_effects.attack_damage.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.attack_damage.math *= $abs cse.status_effects.attack_damage.math

execute \
    if score #base.abs cse.status_effects.attack_damage.math < #max.abs cse.status_effects.attack_damage.math run \
scoreboard players operation #base cse.status_effects.attack_damage.math += #value cse.status_effects.attack_damage.math

execute \
    if score #base.abs cse.status_effects.attack_damage.math >= #max.abs cse.status_effects.attack_damage.math run \
scoreboard players operation #base cse.status_effects.attack_damage.math = #max cse.status_effects.attack_damage.math

execute \
    store result entity @s data.cse.attack_damage.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.attack_damage.math