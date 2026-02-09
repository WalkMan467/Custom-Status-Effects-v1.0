# ID Register

execute \
    unless score @s cse.status_effects.movement_efficiency.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.movement_efficiency.id 1

execute \
    unless score @s cse.status_effects.movement_efficiency.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.movement_efficiency.id = #global cse.status_effects.movement_efficiency.id

# Status Effects Base Value

tag @s add cse.status_effect.movement_efficiency.new

$execute \
    if score @s cse.status_effects.movement_efficiency.id = @n[tag=cse.status_effect.movement_efficiency.data,tag=cse.status_effect.movement_efficiency.id.$(id),tag=cse.status_effect.movement_efficiency.$(type),distance=0..,type=marker] cse.status_effects.movement_efficiency.id run \
tag @s remove cse.status_effect.movement_efficiency.new

$attribute @s[tag=cse.status_effect.movement_efficiency.new] minecraft:movement_efficiency modifier add cse.status_effects.movement_efficiency.$(id).$(type) $(base) $(type)

tag @s remove cse.status_effect.movement_efficiency.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.movement_efficiency.data,tag=cse.status_effect.movement_efficiency.id.$(id),tag=cse.status_effect.movement_efficiency.$(type),distance=0..,type=marker] run \
tag @s add cse.status_effect.movement_efficiency.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.movement_efficiency.new] run \
function cse:status_effects/apply/movement_efficiency/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max), type:"$(type)"}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.movement_efficiency.new] \
    if entity @n[tag=cse.status_effect.movement_efficiency.data,tag=cse.status_effect.movement_efficiency.id.$(id),tag=cse.status_effect.movement_efficiency.$(type),distance=0..,type=marker] run \
function cse:status_effects/apply/movement_efficiency/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max), type:"$(type)"}

# Remove Tag
tag @s remove cse.status_effect.movement_efficiency.new

execute \
    if entity @s[tag=cse.status_effect.movement_efficiency] \
    if score @s cse.status_effects.movement_efficiency.base.value < @s cse.status_effects.movement_efficiency.value.max run \
scoreboard players operation @s cse.status_effects.movement_efficiency.base.value += @s cse.status_effects.movement_efficiency.value

execute \
    if entity @s[tag=cse.status_effect.movement_efficiency] \
    if score @s cse.status_effects.movement_efficiency.base.value >= @s cse.status_effects.movement_efficiency.value.max run \
scoreboard players operation @s cse.status_effects.movement_efficiency.base.value = @s cse.status_effects.movement_efficiency.value.max
tag @s add cse.status_effect.movement_efficiency

schedule function cse:status_effects/apply/movement_efficiency/main 1t