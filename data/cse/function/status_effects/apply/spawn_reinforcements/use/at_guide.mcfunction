# ID Register

execute \
    unless score @s cse.status_effects.spawn_reinforcements.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.spawn_reinforcements.id 1

execute \
    unless score @s cse.status_effects.spawn_reinforcements.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.spawn_reinforcements.id = #global cse.status_effects.spawn_reinforcements.id

# Status Effects Base Value

tag @s add cse.status_effect.spawn_reinforcements.new

$execute \
    if score @s cse.status_effects.spawn_reinforcements.id = @n[tag=cse.status_effect.spawn_reinforcements.data,tag=cse.status_effect.spawn_reinforcements.id.$(id),tag=cse.status_effect.spawn_reinforcements.$(type),distance=0..,type=marker] cse.status_effects.spawn_reinforcements.id run \
tag @s remove cse.status_effect.spawn_reinforcements.new

$attribute @s[tag=cse.status_effect.spawn_reinforcements.new] minecraft:spawn_reinforcements modifier add cse.status_effects.spawn_reinforcements.$(id).$(type) $(base) $(type)

tag @s remove cse.status_effect.spawn_reinforcements.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.spawn_reinforcements.data,tag=cse.status_effect.spawn_reinforcements.id.$(id),tag=cse.status_effect.spawn_reinforcements.$(type),distance=0..,type=marker] run \
tag @s add cse.status_effect.spawn_reinforcements.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.spawn_reinforcements.new] run \
function cse:status_effects/apply/spawn_reinforcements/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max), type:"$(type)"}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.spawn_reinforcements.new] \
    if entity @n[tag=cse.status_effect.spawn_reinforcements.data,tag=cse.status_effect.spawn_reinforcements.id.$(id),tag=cse.status_effect.spawn_reinforcements.$(type),distance=0..,type=marker] run \
function cse:status_effects/apply/spawn_reinforcements/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max), type:"$(type)"}

# Remove Tag
tag @s remove cse.status_effect.spawn_reinforcements.new

execute \
    if entity @s[tag=cse.status_effect.spawn_reinforcements] \
    if score @s cse.status_effects.spawn_reinforcements.base.value < @s cse.status_effects.spawn_reinforcements.value.max run \
scoreboard players operation @s cse.status_effects.spawn_reinforcements.base.value += @s cse.status_effects.spawn_reinforcements.value

execute \
    if entity @s[tag=cse.status_effect.spawn_reinforcements] \
    if score @s cse.status_effects.spawn_reinforcements.base.value >= @s cse.status_effects.spawn_reinforcements.value.max run \
scoreboard players operation @s cse.status_effects.spawn_reinforcements.base.value = @s cse.status_effects.spawn_reinforcements.value.max
tag @s add cse.status_effect.spawn_reinforcements

schedule function cse:status_effects/apply/spawn_reinforcements/main 1t