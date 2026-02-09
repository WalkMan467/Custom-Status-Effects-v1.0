# ID Register

execute \
    unless score @s cse.status_effects.max_health.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.max_health.id 1

execute \
    unless score @s cse.status_effects.max_health.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.max_health.id = #global cse.status_effects.max_health.id

# Status Effects Base Value

tag @s add cse.status_effect.max_health.new

$execute \
    if score @s cse.status_effects.max_health.id = @n[tag=cse.status_effect.max_health.data,tag=cse.status_effect.max_health.id.$(id),tag=cse.status_effect.max_health.$(type),distance=0..,type=marker] cse.status_effects.max_health.id run \
tag @s remove cse.status_effect.max_health.new

$attribute @s[tag=cse.status_effect.max_health.new] minecraft:max_health modifier add cse.status_effects.max_health.$(id).$(type) $(base) $(type)

tag @s remove cse.status_effect.max_health.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.max_health.data,tag=cse.status_effect.max_health.id.$(id),tag=cse.status_effect.max_health.$(type),distance=0..,type=marker] run \
tag @s add cse.status_effect.max_health.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.max_health.new] run \
function cse:status_effects/apply/max_health/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max), type:"$(type)"}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.max_health.new] \
    if entity @n[tag=cse.status_effect.max_health.data,tag=cse.status_effect.max_health.id.$(id),tag=cse.status_effect.max_health.$(type),distance=0..,type=marker] run \
function cse:status_effects/apply/max_health/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max), type:"$(type)"}

# Remove Tag
tag @s remove cse.status_effect.max_health.new

execute \
    if entity @s[tag=cse.status_effect.max_health] \
    if score @s cse.status_effects.max_health.base.value < @s cse.status_effects.max_health.value.max run \
scoreboard players operation @s cse.status_effects.max_health.base.value += @s cse.status_effects.max_health.value

execute \
    if entity @s[tag=cse.status_effect.max_health] \
    if score @s cse.status_effects.max_health.base.value >= @s cse.status_effects.max_health.value.max run \
scoreboard players operation @s cse.status_effects.max_health.base.value = @s cse.status_effects.max_health.value.max
tag @s add cse.status_effect.max_health

schedule function cse:status_effects/apply/max_health/main 1t