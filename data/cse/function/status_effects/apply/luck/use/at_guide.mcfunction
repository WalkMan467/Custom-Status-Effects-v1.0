# ID Register

execute \
    unless score @s cse.status_effects.luck.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.luck.id 1

execute \
    unless score @s cse.status_effects.luck.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.luck.id = #global cse.status_effects.luck.id

# Status Effects Base Value

tag @s add cse.status_effect.luck.new

$execute \
    if score @s cse.status_effects.luck.id = @n[tag=cse.status_effect.luck.data,tag=cse.status_effect.luck.id.$(id),tag=cse.status_effect.luck.$(type),distance=0..,type=marker] cse.status_effects.luck.id run \
tag @s remove cse.status_effect.luck.new

$attribute @s[tag=cse.status_effect.luck.new] minecraft:luck modifier add cse.status_effects.luck.$(id).$(type) $(base) $(type)

tag @s remove cse.status_effect.luck.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.luck.data,tag=cse.status_effect.luck.id.$(id),tag=cse.status_effect.luck.$(type),distance=0..,type=marker] run \
tag @s add cse.status_effect.luck.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.luck.new] run \
function cse:status_effects/apply/luck/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max), type:"$(type)"}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.luck.new] \
    if entity @n[tag=cse.status_effect.luck.data,tag=cse.status_effect.luck.id.$(id),tag=cse.status_effect.luck.$(type),distance=0..,type=marker] run \
function cse:status_effects/apply/luck/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max), type:"$(type)"}

# Remove Tag
tag @s remove cse.status_effect.luck.new

execute \
    if entity @s[tag=cse.status_effect.luck] \
    if score @s cse.status_effects.luck.base.value < @s cse.status_effects.luck.value.max run \
scoreboard players operation @s cse.status_effects.luck.base.value += @s cse.status_effects.luck.value

execute \
    if entity @s[tag=cse.status_effect.luck] \
    if score @s cse.status_effects.luck.base.value >= @s cse.status_effects.luck.value.max run \
scoreboard players operation @s cse.status_effects.luck.base.value = @s cse.status_effects.luck.value.max
tag @s add cse.status_effect.luck

schedule function cse:status_effects/apply/luck/main 1t