# ID Register

execute \
    unless score @s cse.status_effects.armor_toughness.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.armor_toughness.id 1

execute \
    unless score @s cse.status_effects.armor_toughness.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.armor_toughness.id = #global cse.status_effects.armor_toughness.id

# Status Effects Base Value
tag @s add cse.status_effect.armor_toughness.new

$execute \
    if score @s cse.status_effects.armor_toughness.id = @n[tag=cse.status_effect.armor_toughness.data,tag=cse.status_effect.armor_toughness.id.$(id),distance=0..,type=marker] cse.status_effects.armor_toughness.id run \
tag @s remove cse.status_effect.armor_toughness.new

$attribute @s[tag=cse.status_effect.armor_toughness.new] minecraft:armor_toughness modifier add cse.status_effects.armor_toughness.$(id) $(base) add_multiplied_base

tag @s remove cse.status_effect.armor_toughness.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.armor_toughness.data,tag=cse.status_effect.armor_toughness.id.$(id),distance=0..,type=marker] run \
tag @s add cse.status_effect.armor_toughness.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.armor_toughness.new] run \
function cse:status_effects/apply/armor_toughness/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max)}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.armor_toughness.new] \
    if entity @n[tag=cse.status_effect.armor_toughness.data,tag=cse.status_effect.armor_toughness.id.$(id),distance=0..,type=marker] run \
function cse:status_effects/apply/armor_toughness/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max)}

# Remove Tag
tag @s remove cse.status_effect.armor_toughness.new

execute \
    if entity @s[tag=cse.status_effect.armor_toughness] \
    if score @s cse.status_effects.armor_toughness.base.value < @s cse.status_effects.armor_toughness.value.max run \
scoreboard players operation @s cse.status_effects.armor_toughness.base.value += @s cse.status_effects.armor_toughness.value

execute \
    if entity @s[tag=cse.status_effect.armor_toughness] \
    if score @s cse.status_effects.armor_toughness.base.value >= @s cse.status_effects.armor_toughness.value.max run \
scoreboard players operation @s cse.status_effects.armor_toughness.base.value = @s cse.status_effects.armor_toughness.value.max
tag @s add cse.status_effect.armor_toughness

schedule function cse:status_effects/apply/armor_toughness/main 1t