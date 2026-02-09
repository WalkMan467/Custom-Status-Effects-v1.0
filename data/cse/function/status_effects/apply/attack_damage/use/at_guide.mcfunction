# ID Register

execute \
    unless score @s cse.status_effects.attack_damage.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.attack_damage.id 1

execute \
    unless score @s cse.status_effects.attack_damage.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.attack_damage.id = #global cse.status_effects.attack_damage.id

# Status Effects Base Value

tag @s add cse.status_effect.attack_damage.new

$execute \
    if score @s cse.status_effects.attack_damage.id = @n[tag=cse.status_effect.attack_damage.data,tag=cse.status_effect.attack_damage.id.$(id),tag=cse.status_effect.attack_damage.$(type),distance=0..,type=marker] cse.status_effects.attack_damage.id run \
tag @s remove cse.status_effect.attack_damage.new

$attribute @s[tag=cse.status_effect.attack_damage.new] minecraft:attack_damage modifier add cse.status_effects.attack_damage.$(id).$(type) $(base) $(type)

tag @s remove cse.status_effect.attack_damage.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.attack_damage.data,tag=cse.status_effect.attack_damage.id.$(id),tag=cse.status_effect.attack_damage.$(type),distance=0..,type=marker] run \
tag @s add cse.status_effect.attack_damage.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.attack_damage.new] run \
function cse:status_effects/apply/attack_damage/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max), type:"$(type)"}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.attack_damage.new] \
    if entity @n[tag=cse.status_effect.attack_damage.data,tag=cse.status_effect.attack_damage.id.$(id),tag=cse.status_effect.attack_damage.$(type),distance=0..,type=marker] run \
function cse:status_effects/apply/attack_damage/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max), type:"$(type)"}

# Remove Tag
tag @s remove cse.status_effect.attack_damage.new

execute \
    if entity @s[tag=cse.status_effect.attack_damage] \
    if score @s cse.status_effects.attack_damage.base.value < @s cse.status_effects.attack_damage.value.max run \
scoreboard players operation @s cse.status_effects.attack_damage.base.value += @s cse.status_effects.attack_damage.value

execute \
    if entity @s[tag=cse.status_effect.attack_damage] \
    if score @s cse.status_effects.attack_damage.base.value >= @s cse.status_effects.attack_damage.value.max run \
scoreboard players operation @s cse.status_effects.attack_damage.base.value = @s cse.status_effects.attack_damage.value.max
tag @s add cse.status_effect.attack_damage

schedule function cse:status_effects/apply/attack_damage/main 1t