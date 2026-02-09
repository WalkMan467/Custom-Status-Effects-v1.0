# ID Register

execute \
    unless score @s cse.status_effects.scale.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.scale.id 1

execute \
    unless score @s cse.status_effects.scale.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.scale.id = #global cse.status_effects.scale.id

# Status Effects Base Value

tag @s add cse.status_effect.scale.new

$execute \
    if score @s cse.status_effects.scale.id = @n[tag=cse.status_effect.scale.data,tag=cse.status_effect.scale.id.$(id),tag=cse.status_effect.scale.$(type),distance=0..,type=marker] cse.status_effects.scale.id run \
tag @s remove cse.status_effect.scale.new

$attribute @s[tag=cse.status_effect.scale.new] minecraft:scale modifier add cse.status_effects.scale.$(id).$(type) $(base) $(type)

tag @s remove cse.status_effect.scale.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.scale.data,tag=cse.status_effect.scale.id.$(id),tag=cse.status_effect.scale.$(type),distance=0..,type=marker] run \
tag @s add cse.status_effect.scale.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.scale.new] run \
function cse:status_effects/apply/scale/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max), type:"$(type)"}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.scale.new] \
    if entity @n[tag=cse.status_effect.scale.data,tag=cse.status_effect.scale.id.$(id),tag=cse.status_effect.scale.$(type),distance=0..,type=marker] run \
function cse:status_effects/apply/scale/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max), type:"$(type)"}

# Remove Tag
tag @s remove cse.status_effect.scale.new

execute \
    if entity @s[tag=cse.status_effect.scale] \
    if score @s cse.status_effects.scale.base.value < @s cse.status_effects.scale.value.max run \
scoreboard players operation @s cse.status_effects.scale.base.value += @s cse.status_effects.scale.value

execute \
    if entity @s[tag=cse.status_effect.scale] \
    if score @s cse.status_effects.scale.base.value >= @s cse.status_effects.scale.value.max run \
scoreboard players operation @s cse.status_effects.scale.base.value = @s cse.status_effects.scale.value.max
tag @s add cse.status_effect.scale

schedule function cse:status_effects/apply/scale/main 1t