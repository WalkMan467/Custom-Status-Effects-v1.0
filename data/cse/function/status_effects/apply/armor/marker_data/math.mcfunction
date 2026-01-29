# @s = Status Effects Marker

$data modify entity @s data.cse.armor.add.value set value $(value)f
$data modify entity @s data.cse.armor.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.armor $(duration)

function cse:status_effects/apply/armor/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.armor.math run \
data get entity @s data.cse.armor.add.value 1000

execute \
    store result score #base cse.status_effects.armor.math run \
data get entity @s data.cse.armor.base_value 1000

execute \
    store result score #max cse.status_effects.armor.math run \
data get entity @s data.cse.armor.max_value 1000

scoreboard players set #abs cse.global.main -1

scoreboard players set $abs cse.status_effects.armor.math -1
scoreboard players operation #base.abs cse.status_effects.armor.math = #base cse.status_effects.armor.math
scoreboard players operation #max.abs cse.status_effects.armor.math = #max cse.status_effects.armor.math

execute \
    if score #base cse.status_effects.armor.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.armor.math *= $abs cse.status_effects.armor.math

execute \
    if score #max cse.status_effects.armor.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.armor.math *= $abs cse.status_effects.armor.math

execute \
    if score #base.abs cse.status_effects.armor.math < #max.abs cse.status_effects.armor.math run \
scoreboard players operation #base cse.status_effects.armor.math += #value cse.status_effects.armor.math

execute \
    if score #base.abs cse.status_effects.armor.math >= #max.abs cse.status_effects.armor.math run \
scoreboard players operation #base cse.status_effects.armor.math = #max cse.status_effects.armor.math

execute \
    store result entity @s data.cse.armor.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.armor.math