$data modify storage temp2 data.max set value $(max)
$data modify storage temp2 data.duration set value $(duration)

function cse:status_effects/apply/soul_restraint/scoreboard

scoreboard players reset #cse.temp.duration cse.global.main
scoreboard players reset #cse.temp.max cse.global.main

tag @s add cse.detect.1

execute \
    store result score #cse.temp.max cse.status_effects.soul_restraint.max_range run \
data get storage temp2 data.max 100

execute \
    store result score #cse.temp.duration cse.status_effects.soul_restraint run \
data get storage temp2 data.duration 1

execute unless score #cse.temp.max cse.status_effects.soul_restraint.max_range matches 1.. run \
tag @s remove cse.detect.1

execute unless score #cse.temp.duration cse.status_effects.soul_restraint matches 1.. run \
tag @s remove cse.detect.1

data remove storage minecraft:temp2 data

execute \
    unless entity @s[tag=cse.detect.1] run \
function cse:status_effects/apply/soul_restraint/error/1

execute \
    unless entity @s[tag=cse.detect.1] run \
return 0

tag @s add cse.soul_restraint.user

execute \
    as @e[sort=arbitrary,tag=cse.soul_restraint.display,distance=0..,type=item_display] at @s \
    if score @s cse.status_effects.soul_restraint.id = @p[tag=cse.soul_restraint.user,sort=arbitrary,distance=..30] cse.status_effects.soul_restraint.id run \
function cse:status_effects/apply/soul_restraint/spear/end

$scoreboard players set @s cse.status_effects.soul_restraint $(duration)


scoreboard players add #index cse.status_effects.soul_restraint.id 1
scoreboard players operation @s cse.status_effects.soul_restraint.id = #index cse.status_effects.soul_restraint.id
scoreboard players operation @s cse.status_effects.soul_restraint.max_range = #cse.temp.max cse.status_effects.soul_restraint.max_range
scoreboard players set #10 cse.status_effects.soul_restraint.max_range 10
scoreboard players operation @s cse.status_effects.soul_restraint.max_range /= #10 cse.status_effects.soul_restraint.max_range

tag @s remove cse.detect.1
scoreboard players reset #cse.temp.duration cse.global.main
scoreboard players reset #cse.temp.max cse.global.main

summon minecraft:item_display ~ ~ ~ {start_interpolation:1,teleport_duration:2,interpolation_duration:2,Tags:["cse.soul_restraint.display","summon"],Passengers: [{start_interpolation:1,teleport_duration:2,interpolation_duration:2, brightness: {block: 15, sky: 15}, id: "minecraft:item_display", item: {count: 1, id: "minecraft:stone_spear"}, transformation: {left_rotation: [-0.65328145f, 0.27059814f, -0.65328145f, 0.27059814f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [8.0f, 7.999999f, 3.9999995f], translation: [0.0f, 8.2499995f, 2.3841858E-7f]}}], brightness: {block: 15, sky: 15}, item: {count: 1, id: "minecraft:stone_spear"}, transformation: {left_rotation: [0.0f, 0.0f, 0.9238795f, -0.38268346f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [8.0f, 8.0f, 4.0f], translation: [0.0f, 8.0f, 0.0f]}}

playsound minecraft:item.trident.thunder voice @a ~ ~ ~ 1 2
playsound minecraft:entity.zombie.break_wooden_door voice @a ~ ~ ~ 0.75 0.875
playsound minecraft:entity.creaking.attack voice @a ~ ~ ~ 1 0.75
playsound minecraft:entity.creaking.activate voice @a ~ ~ ~ 1 0.5
playsound minecraft:block.respawn_anchor.deplete voice @a ~ ~ ~ 1 0.75

execute \
    as @n[sort=arbitrary,tag=summon,tag=cse.soul_restraint.display,type=item_display] at @s run \
function cse:status_effects/apply/soul_restraint/setup

tag @s remove cse.soul_restraint.user

function cse:status_effects/apply/soul_restraint/main