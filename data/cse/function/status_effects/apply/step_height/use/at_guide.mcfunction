# ID Register

execute \
    unless score @s cse.status_effects.step_height.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.step_height.id 1

execute \
    unless score @s cse.status_effects.step_height.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.step_height.id = #global cse.status_effects.step_height.id

# Status Effects Base Value

tag @s add cse.status_effect.step_height.new

$execute \
    if score @s cse.status_effects.step_height.id = @n[tag=cse.status_effect.step_height.data,tag=cse.status_effect.step_height.id.$(id),tag=cse.status_effect.step_height.$(type),distance=0..,type=marker] cse.status_effects.step_height.id run \
tag @s remove cse.status_effect.step_height.new

$attribute @s[tag=cse.status_effect.step_height.new] minecraft:step_height modifier add cse.status_effects.step_height.$(id).$(type) $(base) $(type)

tag @s remove cse.status_effect.step_height.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.step_height.data,tag=cse.status_effect.step_height.id.$(id),tag=cse.status_effect.step_height.$(type),distance=0..,type=marker] run \
tag @s add cse.status_effect.step_height.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.step_height.new] run \
function cse:status_effects/apply/step_height/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max), type:"$(type)"}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.step_height.new] \
    if entity @n[tag=cse.status_effect.step_height.data,tag=cse.status_effect.step_height.id.$(id),tag=cse.status_effect.step_height.$(type),distance=0..,type=marker] run \
function cse:status_effects/apply/step_height/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max), type:"$(type)"}

# Remove Tag
tag @s remove cse.status_effect.step_height.new

execute \
    if entity @s[tag=cse.status_effect.step_height] \
    if score @s cse.status_effects.step_height.base.value < @s cse.status_effects.step_height.value.max run \
scoreboard players operation @s cse.status_effects.step_height.base.value += @s cse.status_effects.step_height.value

execute \
    if entity @s[tag=cse.status_effect.step_height] \
    if score @s cse.status_effects.step_height.base.value >= @s cse.status_effects.step_height.value.max run \
scoreboard players operation @s cse.status_effects.step_height.base.value = @s cse.status_effects.step_height.value.max
tag @s add cse.status_effect.step_height

schedule function cse:status_effects/apply/step_height/main 1t