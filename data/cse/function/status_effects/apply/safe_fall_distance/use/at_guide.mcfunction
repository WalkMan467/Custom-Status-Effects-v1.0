# ID Register

execute \
    unless score @s cse.status_effects.safe_fall_distance.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.safe_fall_distance.id 1

execute \
    unless score @s cse.status_effects.safe_fall_distance.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.safe_fall_distance.id = #global cse.status_effects.safe_fall_distance.id

# Status Effects Base Value

tag @s add cse.status_effect.safe_fall_distance.new

$execute \
    if score @s cse.status_effects.safe_fall_distance.id = @n[tag=cse.status_effect.safe_fall_distance.data,tag=cse.status_effect.safe_fall_distance.id.$(id),tag=cse.status_effect.safe_fall_distance.$(type),distance=0..,type=marker] cse.status_effects.safe_fall_distance.id run \
tag @s remove cse.status_effect.safe_fall_distance.new

$attribute @s[tag=cse.status_effect.safe_fall_distance.new] minecraft:safe_fall_distance modifier add cse.status_effects.safe_fall_distance.$(id).$(type) $(base) $(type)

tag @s remove cse.status_effect.safe_fall_distance.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.safe_fall_distance.data,tag=cse.status_effect.safe_fall_distance.id.$(id),tag=cse.status_effect.safe_fall_distance.$(type),distance=0..,type=marker] run \
tag @s add cse.status_effect.safe_fall_distance.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.safe_fall_distance.new] run \
function cse:status_effects/apply/safe_fall_distance/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max), type:"$(type)"}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.safe_fall_distance.new] \
    if entity @n[tag=cse.status_effect.safe_fall_distance.data,tag=cse.status_effect.safe_fall_distance.id.$(id),tag=cse.status_effect.safe_fall_distance.$(type),distance=0..,type=marker] run \
function cse:status_effects/apply/safe_fall_distance/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max), type:"$(type)"}

# Remove Tag
tag @s remove cse.status_effect.safe_fall_distance.new

execute \
    if entity @s[tag=cse.status_effect.safe_fall_distance] \
    if score @s cse.status_effects.safe_fall_distance.base.value < @s cse.status_effects.safe_fall_distance.value.max run \
scoreboard players operation @s cse.status_effects.safe_fall_distance.base.value += @s cse.status_effects.safe_fall_distance.value

execute \
    if entity @s[tag=cse.status_effect.safe_fall_distance] \
    if score @s cse.status_effects.safe_fall_distance.base.value >= @s cse.status_effects.safe_fall_distance.value.max run \
scoreboard players operation @s cse.status_effects.safe_fall_distance.base.value = @s cse.status_effects.safe_fall_distance.value.max
tag @s add cse.status_effect.safe_fall_distance

schedule function cse:status_effects/apply/safe_fall_distance/main 1t