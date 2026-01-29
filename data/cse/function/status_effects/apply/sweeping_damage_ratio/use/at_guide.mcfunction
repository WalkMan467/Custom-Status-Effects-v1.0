# ID Register

execute \
    unless score @s cse.status_effects.sweeping_damage_ratio.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.sweeping_damage_ratio.id 1

execute \
    unless score @s cse.status_effects.sweeping_damage_ratio.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.sweeping_damage_ratio.id = #global cse.status_effects.sweeping_damage_ratio.id

# Status Effects Base Value
tag @s add cse.status_effect.sweeping_damage_ratio.new

$execute \
    if score @s cse.status_effects.sweeping_damage_ratio.id = @n[tag=cse.status_effect.sweeping_damage_ratio.data,tag=cse.status_effect.sweeping_damage_ratio.id.$(id),distance=0..,type=marker] cse.status_effects.sweeping_damage_ratio.id run \
tag @s remove cse.status_effect.sweeping_damage_ratio.new

$attribute @s[tag=cse.status_effect.sweeping_damage_ratio.new] minecraft:sweeping_damage_ratio modifier add cse.status_effects.sweeping_damage_ratio.$(id) $(base) add_multiplied_base

tag @s remove cse.status_effect.sweeping_damage_ratio.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.sweeping_damage_ratio.data,tag=cse.status_effect.sweeping_damage_ratio.id.$(id),distance=0..,type=marker] run \
tag @s add cse.status_effect.sweeping_damage_ratio.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.sweeping_damage_ratio.new] run \
function cse:status_effects/apply/sweeping_damage_ratio/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max)}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.sweeping_damage_ratio.new] \
    if entity @n[tag=cse.status_effect.sweeping_damage_ratio.data,tag=cse.status_effect.sweeping_damage_ratio.id.$(id),distance=0..,type=marker] run \
function cse:status_effects/apply/sweeping_damage_ratio/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max)}

# Remove Tag
tag @s remove cse.status_effect.sweeping_damage_ratio.new

execute \
    if entity @s[tag=cse.status_effect.sweeping_damage_ratio] \
    if score @s cse.status_effects.sweeping_damage_ratio.base.value < @s cse.status_effects.sweeping_damage_ratio.value.max run \
scoreboard players operation @s cse.status_effects.sweeping_damage_ratio.base.value += @s cse.status_effects.sweeping_damage_ratio.value

execute \
    if entity @s[tag=cse.status_effect.sweeping_damage_ratio] \
    if score @s cse.status_effects.sweeping_damage_ratio.base.value >= @s cse.status_effects.sweeping_damage_ratio.value.max run \
scoreboard players operation @s cse.status_effects.sweeping_damage_ratio.base.value = @s cse.status_effects.sweeping_damage_ratio.value.max
tag @s add cse.status_effect.sweeping_damage_ratio

schedule function cse:status_effects/apply/sweeping_damage_ratio/main 1t