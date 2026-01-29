# ID Register

execute \
    unless score @s cse.status_effects.armor.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.armor.id 1

execute \
    unless score @s cse.status_effects.armor.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.armor.id = #global cse.status_effects.armor.id

# Status Effects Base Value

tag @s add cse.status_effect.armor.new

$execute \
    if score @s cse.status_effects.armor.id = @n[tag=cse.status_effect.armor.data,tag=cse.status_effect.armor.id.$(id),distance=0..,type=marker] cse.status_effects.armor.id run \
tag @s remove cse.status_effect.armor.new

$attribute @s[tag=cse.status_effect.armor.new] minecraft:armor modifier add cse.status_effects.armor.$(id) $(base) add_multiplied_base

tag @s remove cse.status_effect.armor.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.armor.data,tag=cse.status_effect.armor.id.$(id),distance=0..,type=marker] run \
tag @s add cse.status_effect.armor.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.armor.new] run \
function cse:status_effects/apply/armor/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max)}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.armor.new] \
    if entity @n[tag=cse.status_effect.armor.data,tag=cse.status_effect.armor.id.$(id),distance=0..,type=marker] run \
function cse:status_effects/apply/armor/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max)}

# Remove Tag
tag @s remove cse.status_effect.armor.new

execute \
    if entity @s[tag=cse.status_effect.armor] \
    if score @s cse.status_effects.armor.base.value < @s cse.status_effects.armor.value.max run \
scoreboard players operation @s cse.status_effects.armor.base.value += @s cse.status_effects.armor.value

execute \
    if entity @s[tag=cse.status_effect.armor] \
    if score @s cse.status_effects.armor.base.value >= @s cse.status_effects.armor.value.max run \
scoreboard players operation @s cse.status_effects.armor.base.value = @s cse.status_effects.armor.value.max
tag @s add cse.status_effect.armor

schedule function cse:status_effects/apply/armor/main 1t