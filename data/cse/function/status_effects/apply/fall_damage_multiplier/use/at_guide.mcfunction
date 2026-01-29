# ID Register

execute \
    unless score @s cse.status_effects.fall_damage_multiplier.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.fall_damage_multiplier.id 1

execute \
    unless score @s cse.status_effects.fall_damage_multiplier.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.fall_damage_multiplier.id = #global cse.status_effects.fall_damage_multiplier.id

# Status Effects Base Value
tag @s add cse.status_effect.fall_damage_multiplier.new

$execute \
    if score @s cse.status_effects.fall_damage_multiplier.id = @n[tag=cse.status_effect.fall_damage_multiplier.data,tag=cse.status_effect.fall_damage_multiplier.id.$(id),distance=0..,type=marker] cse.status_effects.fall_damage_multiplier.id run \
tag @s remove cse.status_effect.fall_damage_multiplier.new

$attribute @s[tag=cse.status_effect.fall_damage_multiplier.new] minecraft:fall_damage_multiplier modifier add cse.status_effects.fall_damage_multiplier.$(id) $(base) add_multiplied_base

tag @s remove cse.status_effect.fall_damage_multiplier.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.fall_damage_multiplier.data,tag=cse.status_effect.fall_damage_multiplier.id.$(id),distance=0..,type=marker] run \
tag @s add cse.status_effect.fall_damage_multiplier.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.fall_damage_multiplier.new] run \
function cse:status_effects/apply/fall_damage_multiplier/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max)}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.fall_damage_multiplier.new] \
    if entity @n[tag=cse.status_effect.fall_damage_multiplier.data,tag=cse.status_effect.fall_damage_multiplier.id.$(id),distance=0..,type=marker] run \
function cse:status_effects/apply/fall_damage_multiplier/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max)}

# Remove Tag
tag @s remove cse.status_effect.fall_damage_multiplier.new

execute \
    if entity @s[tag=cse.status_effect.fall_damage_multiplier] \
    if score @s cse.status_effects.fall_damage_multiplier.base.value < @s cse.status_effects.fall_damage_multiplier.value.max run \
scoreboard players operation @s cse.status_effects.fall_damage_multiplier.base.value += @s cse.status_effects.fall_damage_multiplier.value

execute \
    if entity @s[tag=cse.status_effect.fall_damage_multiplier] \
    if score @s cse.status_effects.fall_damage_multiplier.base.value >= @s cse.status_effects.fall_damage_multiplier.value.max run \
scoreboard players operation @s cse.status_effects.fall_damage_multiplier.base.value = @s cse.status_effects.fall_damage_multiplier.value.max
tag @s add cse.status_effect.fall_damage_multiplier

schedule function cse:status_effects/apply/fall_damage_multiplier/main 1t