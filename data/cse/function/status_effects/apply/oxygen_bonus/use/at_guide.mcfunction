# ID Register

execute \
    unless score @s cse.status_effects.oxygen_bonus.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.oxygen_bonus.id 1

execute \
    unless score @s cse.status_effects.oxygen_bonus.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.oxygen_bonus.id = #global cse.status_effects.oxygen_bonus.id

# Status Effects Base Value
tag @s add cse.status_effect.oxygen_bonus.new

$execute \
    if score @s cse.status_effects.oxygen_bonus.id = @n[tag=cse.status_effect.oxygen_bonus.data,tag=cse.status_effect.oxygen_bonus.id.$(id),distance=0..,type=marker] cse.status_effects.oxygen_bonus.id run \
tag @s remove cse.status_effect.oxygen_bonus.new

$attribute @s[tag=cse.status_effect.oxygen_bonus.new] minecraft:oxygen_bonus modifier add cse.status_effects.oxygen_bonus.$(id) $(base) add_multiplied_base

tag @s remove cse.status_effect.oxygen_bonus.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.oxygen_bonus.data,tag=cse.status_effect.oxygen_bonus.id.$(id),distance=0..,type=marker] run \
tag @s add cse.status_effect.oxygen_bonus.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.oxygen_bonus.new] run \
function cse:status_effects/apply/oxygen_bonus/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max)}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.oxygen_bonus.new] \
    if entity @n[tag=cse.status_effect.oxygen_bonus.data,tag=cse.status_effect.oxygen_bonus.id.$(id),distance=0..,type=marker] run \
function cse:status_effects/apply/oxygen_bonus/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max)}

# Remove Tag
tag @s remove cse.status_effect.oxygen_bonus.new

execute \
    if entity @s[tag=cse.status_effect.oxygen_bonus] \
    if score @s cse.status_effects.oxygen_bonus.base.value < @s cse.status_effects.oxygen_bonus.value.max run \
scoreboard players operation @s cse.status_effects.oxygen_bonus.base.value += @s cse.status_effects.oxygen_bonus.value

execute \
    if entity @s[tag=cse.status_effect.oxygen_bonus] \
    if score @s cse.status_effects.oxygen_bonus.base.value >= @s cse.status_effects.oxygen_bonus.value.max run \
scoreboard players operation @s cse.status_effects.oxygen_bonus.base.value = @s cse.status_effects.oxygen_bonus.value.max
tag @s add cse.status_effect.oxygen_bonus

schedule function cse:status_effects/apply/oxygen_bonus/main 1t