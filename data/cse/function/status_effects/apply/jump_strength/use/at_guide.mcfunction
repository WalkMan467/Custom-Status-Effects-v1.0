# ID Register

execute \
    unless score @s cse.status_effects.jump_strength.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.jump_strength.id 1

execute \
    unless score @s cse.status_effects.jump_strength.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.jump_strength.id = #global cse.status_effects.jump_strength.id

# Status Effects Base Value
tag @s add cse.status_effect.jump_strength.new

$execute \
    if score @s cse.status_effects.jump_strength.id = @n[tag=cse.status_effect.jump_strength.data,tag=cse.status_effect.jump_strength.id.$(id),distance=0..,type=marker] cse.status_effects.jump_strength.id run \
tag @s remove cse.status_effect.jump_strength.new

$attribute @s[tag=cse.status_effect.jump_strength.new] minecraft:jump_strength modifier add cse.status_effects.jump_strength.$(id) $(base) add_multiplied_base

tag @s remove cse.status_effect.jump_strength.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.jump_strength.data,tag=cse.status_effect.jump_strength.id.$(id),distance=0..,type=marker] run \
tag @s add cse.status_effect.jump_strength.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.jump_strength.new] run \
function cse:status_effects/apply/jump_strength/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max)}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.jump_strength.new] \
    if entity @n[tag=cse.status_effect.jump_strength.data,tag=cse.status_effect.jump_strength.id.$(id),distance=0..,type=marker] run \
function cse:status_effects/apply/jump_strength/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max)}

# Remove Tag
tag @s remove cse.status_effect.jump_strength.new

execute \
    if entity @s[tag=cse.status_effect.jump_strength] \
    if score @s cse.status_effects.jump_strength.base.value < @s cse.status_effects.jump_strength.value.max run \
scoreboard players operation @s cse.status_effects.jump_strength.base.value += @s cse.status_effects.jump_strength.value

execute \
    if entity @s[tag=cse.status_effect.jump_strength] \
    if score @s cse.status_effects.jump_strength.base.value >= @s cse.status_effects.jump_strength.value.max run \
scoreboard players operation @s cse.status_effects.jump_strength.base.value = @s cse.status_effects.jump_strength.value.max
tag @s add cse.status_effect.jump_strength

schedule function cse:status_effects/apply/jump_strength/main 1t