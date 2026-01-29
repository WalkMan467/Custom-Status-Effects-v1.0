# ID Register

execute \
    unless score @s cse.status_effects.burning_time.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.burning_time.id 1

execute \
    unless score @s cse.status_effects.burning_time.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.burning_time.id = #global cse.status_effects.burning_time.id

# Status Effects Base Value
tag @s add cse.status_effect.burning_time.new

$execute \
    if score @s cse.status_effects.burning_time.id = @n[tag=cse.status_effect.burning_time.data,tag=cse.status_effect.burning_time.id.$(id),distance=0..,type=marker] cse.status_effects.burning_time.id run \
tag @s remove cse.status_effect.burning_time.new

$attribute @s[tag=cse.status_effect.burning_time.new] minecraft:burning_time modifier add cse.status_effects.burning_time.$(id) $(base) add_multiplied_base

tag @s remove cse.status_effect.burning_time.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.burning_time.data,tag=cse.status_effect.burning_time.id.$(id),distance=0..,type=marker] run \
tag @s add cse.status_effect.burning_time.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.burning_time.new] run \
function cse:status_effects/apply/burning_time/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max)}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.burning_time.new] \
    if entity @n[tag=cse.status_effect.burning_time.data,tag=cse.status_effect.burning_time.id.$(id),distance=0..,type=marker] run \
function cse:status_effects/apply/burning_time/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max)}

# Remove Tag
tag @s remove cse.status_effect.burning_time.new

execute \
    if entity @s[tag=cse.status_effect.burning_time] \
    if score @s cse.status_effects.burning_time.base.value < @s cse.status_effects.burning_time.value.max run \
scoreboard players operation @s cse.status_effects.burning_time.base.value += @s cse.status_effects.burning_time.value

execute \
    if entity @s[tag=cse.status_effect.burning_time] \
    if score @s cse.status_effects.burning_time.base.value >= @s cse.status_effects.burning_time.value.max run \
scoreboard players operation @s cse.status_effects.burning_time.base.value = @s cse.status_effects.burning_time.value.max
tag @s add cse.status_effect.burning_time

schedule function cse:status_effects/apply/burning_time/main 1t