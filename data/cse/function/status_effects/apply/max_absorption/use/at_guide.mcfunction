# ID Register

execute \
    unless score @s cse.status_effects.max_absorption.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.max_absorption.id 1

execute \
    unless score @s cse.status_effects.max_absorption.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.max_absorption.id = #global cse.status_effects.max_absorption.id

# Status Effects Base Value
tag @s add cse.status_effect.max_absorption.new

$execute \
    if score @s cse.status_effects.max_absorption.id = @n[tag=cse.status_effect.max_absorption.data,tag=cse.status_effect.max_absorption.id.$(id),distance=0..,type=marker] cse.status_effects.max_absorption.id run \
tag @s remove cse.status_effect.max_absorption.new

$attribute @s[tag=cse.status_effect.max_absorption.new] minecraft:max_absorption modifier add cse.status_effects.max_absorption.$(id) $(base) add_multiplied_base

tag @s remove cse.status_effect.max_absorption.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.max_absorption.data,tag=cse.status_effect.max_absorption.id.$(id),distance=0..,type=marker] run \
tag @s add cse.status_effect.max_absorption.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.max_absorption.new] run \
function cse:status_effects/apply/max_absorption/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max)}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.max_absorption.new] \
    if entity @n[tag=cse.status_effect.max_absorption.data,tag=cse.status_effect.max_absorption.id.$(id),distance=0..,type=marker] run \
function cse:status_effects/apply/max_absorption/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max)}

# Remove Tag
tag @s remove cse.status_effect.max_absorption.new

execute \
    if entity @s[tag=cse.status_effect.max_absorption] \
    if score @s cse.status_effects.max_absorption.base.value < @s cse.status_effects.max_absorption.value.max run \
scoreboard players operation @s cse.status_effects.max_absorption.base.value += @s cse.status_effects.max_absorption.value

execute \
    if entity @s[tag=cse.status_effect.max_absorption] \
    if score @s cse.status_effects.max_absorption.base.value >= @s cse.status_effects.max_absorption.value.max run \
scoreboard players operation @s cse.status_effects.max_absorption.base.value = @s cse.status_effects.max_absorption.value.max
tag @s add cse.status_effect.max_absorption

schedule function cse:status_effects/apply/max_absorption/main 1t