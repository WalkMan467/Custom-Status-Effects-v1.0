# ID Register

execute \
    unless score @s cse.status_effects.waypoint_transmit_range.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.waypoint_transmit_range.id 1

execute \
    unless score @s cse.status_effects.waypoint_transmit_range.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.waypoint_transmit_range.id = #global cse.status_effects.waypoint_transmit_range.id

# Status Effects Base Value

tag @s add cse.status_effect.waypoint_transmit_range.new

$execute \
    if score @s cse.status_effects.waypoint_transmit_range.id = @n[tag=cse.status_effect.waypoint_transmit_range.data,tag=cse.status_effect.waypoint_transmit_range.id.$(id),tag=cse.status_effect.waypoint_transmit_range.$(type),distance=0..,type=marker] cse.status_effects.waypoint_transmit_range.id run \
tag @s remove cse.status_effect.waypoint_transmit_range.new

$attribute @s[tag=cse.status_effect.waypoint_transmit_range.new] minecraft:waypoint_transmit_range modifier add cse.status_effects.waypoint_transmit_range.$(id).$(type) $(base) $(type)

tag @s remove cse.status_effect.waypoint_transmit_range.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.waypoint_transmit_range.data,tag=cse.status_effect.waypoint_transmit_range.id.$(id),tag=cse.status_effect.waypoint_transmit_range.$(type),distance=0..,type=marker] run \
tag @s add cse.status_effect.waypoint_transmit_range.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.waypoint_transmit_range.new] run \
function cse:status_effects/apply/waypoint_transmit_range/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max), type:"$(type)"}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.waypoint_transmit_range.new] \
    if entity @n[tag=cse.status_effect.waypoint_transmit_range.data,tag=cse.status_effect.waypoint_transmit_range.id.$(id),tag=cse.status_effect.waypoint_transmit_range.$(type),distance=0..,type=marker] run \
function cse:status_effects/apply/waypoint_transmit_range/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max), type:"$(type)"}

# Remove Tag
tag @s remove cse.status_effect.waypoint_transmit_range.new

execute \
    if entity @s[tag=cse.status_effect.waypoint_transmit_range] \
    if score @s cse.status_effects.waypoint_transmit_range.base.value < @s cse.status_effects.waypoint_transmit_range.value.max run \
scoreboard players operation @s cse.status_effects.waypoint_transmit_range.base.value += @s cse.status_effects.waypoint_transmit_range.value

execute \
    if entity @s[tag=cse.status_effect.waypoint_transmit_range] \
    if score @s cse.status_effects.waypoint_transmit_range.base.value >= @s cse.status_effects.waypoint_transmit_range.value.max run \
scoreboard players operation @s cse.status_effects.waypoint_transmit_range.base.value = @s cse.status_effects.waypoint_transmit_range.value.max
tag @s add cse.status_effect.waypoint_transmit_range

schedule function cse:status_effects/apply/waypoint_transmit_range/main 1t