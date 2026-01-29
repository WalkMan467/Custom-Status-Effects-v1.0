# ID Register

execute \
    unless score @s cse.status_effects.attack_speed.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.attack_speed.id 1

execute \
    unless score @s cse.status_effects.attack_speed.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.attack_speed.id = #global cse.status_effects.attack_speed.id

# Status Effects Base Value
tag @s add cse.status_effect.attack_speed.new

$execute \
    if score @s cse.status_effects.attack_speed.id = @n[tag=cse.status_effect.attack_speed.data,tag=cse.status_effect.attack_speed.id.$(id),distance=0..,type=marker] cse.status_effects.attack_speed.id run \
tag @s remove cse.status_effect.attack_speed.new

$attribute @s[tag=cse.status_effect.attack_speed.new] minecraft:attack_speed modifier add cse.status_effects.attack_speed.$(id) $(base) add_multiplied_base

tag @s remove cse.status_effect.attack_speed.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.attack_speed.data,tag=cse.status_effect.attack_speed.id.$(id),distance=0..,type=marker] run \
tag @s add cse.status_effect.attack_speed.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.attack_speed.new] run \
function cse:status_effects/apply/attack_speed/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max)}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.attack_speed.new] \
    if entity @n[tag=cse.status_effect.attack_speed.data,tag=cse.status_effect.attack_speed.id.$(id),distance=0..,type=marker] run \
function cse:status_effects/apply/attack_speed/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max)}

# Remove Tag
tag @s remove cse.status_effect.attack_speed.new

execute \
    if entity @s[tag=cse.status_effect.attack_speed] \
    if score @s cse.status_effects.attack_speed.base.value < @s cse.status_effects.attack_speed.value.max run \
scoreboard players operation @s cse.status_effects.attack_speed.base.value += @s cse.status_effects.attack_speed.value

execute \
    if entity @s[tag=cse.status_effect.attack_speed] \
    if score @s cse.status_effects.attack_speed.base.value >= @s cse.status_effects.attack_speed.value.max run \
scoreboard players operation @s cse.status_effects.attack_speed.base.value = @s cse.status_effects.attack_speed.value.max
tag @s add cse.status_effect.attack_speed

schedule function cse:status_effects/apply/attack_speed/main 1t