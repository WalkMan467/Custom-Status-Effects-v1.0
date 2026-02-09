# @s = Status Effects Marker

$data modify entity @s data.cse.max_absorption.add.value set value $(value)f
$data modify entity @s data.cse.max_absorption.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.max_absorption $(duration)

function cse:status_effects/apply/max_absorption/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.max_absorption.math run \
data get entity @s data.cse.max_absorption.add.value 1000

execute \
    store result score #base cse.status_effects.max_absorption.math run \
data get entity @s data.cse.max_absorption.base_value 1000

execute \
    store result score #max cse.status_effects.max_absorption.math run \
data get entity @s data.cse.max_absorption.max_value 1000

scoreboard players set #abs cse.global.main -1

scoreboard players set $abs cse.status_effects.max_absorption.math -1
scoreboard players operation #base.abs cse.status_effects.max_absorption.math = #base cse.status_effects.max_absorption.math
scoreboard players operation #max.abs cse.status_effects.max_absorption.math = #max cse.status_effects.max_absorption.math

execute \
    if score #base cse.status_effects.max_absorption.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.max_absorption.math *= $abs cse.status_effects.max_absorption.math

execute \
    if score #max cse.status_effects.max_absorption.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.max_absorption.math *= $abs cse.status_effects.max_absorption.math

execute \
    if score #base.abs cse.status_effects.max_absorption.math < #max.abs cse.status_effects.max_absorption.math run \
scoreboard players operation #base cse.status_effects.max_absorption.math += #value cse.status_effects.max_absorption.math

execute \
    if score #base.abs cse.status_effects.max_absorption.math >= #max.abs cse.status_effects.max_absorption.math run \
scoreboard players operation #base cse.status_effects.max_absorption.math = #max cse.status_effects.max_absorption.math

execute \
    store result entity @s data.cse.max_absorption.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.max_absorption.math