# ID Register

execute \
    unless score @s cse.status_effects.camera_distance.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.camera_distance.id 1

execute \
    unless score @s cse.status_effects.camera_distance.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.camera_distance.id = #global cse.status_effects.camera_distance.id

# Status Effects Base Value
tag @s add cse.status_effect.camera_distance.new

$execute \
    if score @s cse.status_effects.camera_distance.id = @n[tag=cse.status_effect.camera_distance.data,tag=cse.status_effect.camera_distance.id.$(id),distance=0..,type=marker] cse.status_effects.camera_distance.id run \
tag @s remove cse.status_effect.camera_distance.new

$attribute @s[tag=cse.status_effect.camera_distance.new] minecraft:camera_distance modifier add cse.status_effects.camera_distance.$(id) $(base) add_multiplied_base

tag @s remove cse.status_effect.camera_distance.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.camera_distance.data,tag=cse.status_effect.camera_distance.id.$(id),distance=0..,type=marker] run \
tag @s add cse.status_effect.camera_distance.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.camera_distance.new] run \
function cse:status_effects/apply/camera_distance/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max)}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.camera_distance.new] \
    if entity @n[tag=cse.status_effect.camera_distance.data,tag=cse.status_effect.camera_distance.id.$(id),distance=0..,type=marker] run \
function cse:status_effects/apply/camera_distance/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max)}

# Remove Tag
tag @s remove cse.status_effect.camera_distance.new

execute \
    if entity @s[tag=cse.status_effect.camera_distance] \
    if score @s cse.status_effects.camera_distance.base.value < @s cse.status_effects.camera_distance.value.max run \
scoreboard players operation @s cse.status_effects.camera_distance.base.value += @s cse.status_effects.camera_distance.value

execute \
    if entity @s[tag=cse.status_effect.camera_distance] \
    if score @s cse.status_effects.camera_distance.base.value >= @s cse.status_effects.camera_distance.value.max run \
scoreboard players operation @s cse.status_effects.camera_distance.base.value = @s cse.status_effects.camera_distance.value.max
tag @s add cse.status_effect.camera_distance

schedule function cse:status_effects/apply/camera_distance/main 1t