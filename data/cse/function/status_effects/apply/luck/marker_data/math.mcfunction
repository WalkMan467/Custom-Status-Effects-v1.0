# @s = Status Effects Marker

$data modify entity @s data.cse.luck.add.value set value $(value)f
$data modify entity @s data.cse.luck.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.luck $(duration)

function cse:status_effects/apply/luck/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.luck.math run \
data get entity @s data.cse.luck.add.value 1000

execute \
    store result score #base cse.status_effects.luck.math run \
data get entity @s data.cse.luck.base_value 1000

execute \
    store result score #max cse.status_effects.luck.math run \
data get entity @s data.cse.luck.max_value 1000

scoreboard players set #abs cse.global.main -1

scoreboard players set $abs cse.status_effects.luck.math -1
scoreboard players operation #base.abs cse.status_effects.luck.math = #base cse.status_effects.luck.math
scoreboard players operation #max.abs cse.status_effects.luck.math = #max cse.status_effects.luck.math

execute \
    if score #base cse.status_effects.luck.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.luck.math *= $abs cse.status_effects.luck.math

execute \
    if score #max cse.status_effects.luck.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.luck.math *= $abs cse.status_effects.luck.math

execute \
    if score #base.abs cse.status_effects.luck.math < #max.abs cse.status_effects.luck.math run \
scoreboard players operation #base cse.status_effects.luck.math += #value cse.status_effects.luck.math

execute \
    if score #base.abs cse.status_effects.luck.math >= #max.abs cse.status_effects.luck.math run \
scoreboard players operation #base cse.status_effects.luck.math = #max cse.status_effects.luck.math

execute \
    store result entity @s data.cse.luck.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.luck.math