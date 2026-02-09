# ID Register

execute \
    unless score @s cse.status_effects.gravity.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.gravity.id 1

execute \
    unless score @s cse.status_effects.gravity.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.gravity.id = #global cse.status_effects.gravity.id

# Status Effects Base Value

tag @s add cse.status_effect.gravity.new

$execute \
    if score @s cse.status_effects.gravity.id = @n[tag=cse.status_effect.gravity.data,tag=cse.status_effect.gravity.id.$(id),tag=cse.status_effect.gravity.$(type),distance=0..,type=marker] cse.status_effects.gravity.id run \
tag @s remove cse.status_effect.gravity.new

$attribute @s[tag=cse.status_effect.gravity.new] minecraft:gravity modifier add cse.status_effects.gravity.$(id).$(type) $(base) $(type)

tag @s remove cse.status_effect.gravity.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.gravity.data,tag=cse.status_effect.gravity.id.$(id),tag=cse.status_effect.gravity.$(type),distance=0..,type=marker] run \
tag @s add cse.status_effect.gravity.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.gravity.new] run \
function cse:status_effects/apply/gravity/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max), type:"$(type)"}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.gravity.new] \
    if entity @n[tag=cse.status_effect.gravity.data,tag=cse.status_effect.gravity.id.$(id),tag=cse.status_effect.gravity.$(type),distance=0..,type=marker] run \
function cse:status_effects/apply/gravity/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max), type:"$(type)"}

# Remove Tag
tag @s remove cse.status_effect.gravity.new

execute \
    if entity @s[tag=cse.status_effect.gravity] \
    if score @s cse.status_effects.gravity.base.value < @s cse.status_effects.gravity.value.max run \
scoreboard players operation @s cse.status_effects.gravity.base.value += @s cse.status_effects.gravity.value

execute \
    if entity @s[tag=cse.status_effect.gravity] \
    if score @s cse.status_effects.gravity.base.value >= @s cse.status_effects.gravity.value.max run \
scoreboard players operation @s cse.status_effects.gravity.base.value = @s cse.status_effects.gravity.value.max
tag @s add cse.status_effect.gravity

schedule function cse:status_effects/apply/gravity/main 1t