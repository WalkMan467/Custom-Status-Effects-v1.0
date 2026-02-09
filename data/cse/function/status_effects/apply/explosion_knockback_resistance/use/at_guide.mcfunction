# ID Register

execute \
    unless score @s cse.status_effects.explosion_knockback_resistance.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.explosion_knockback_resistance.id 1

execute \
    unless score @s cse.status_effects.explosion_knockback_resistance.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.explosion_knockback_resistance.id = #global cse.status_effects.explosion_knockback_resistance.id

# Status Effects Base Value

tag @s add cse.status_effect.explosion_knockback_resistance.new

$execute \
    if score @s cse.status_effects.explosion_knockback_resistance.id = @n[tag=cse.status_effect.explosion_knockback_resistance.data,tag=cse.status_effect.explosion_knockback_resistance.id.$(id),tag=cse.status_effect.explosion_knockback_resistance.$(type),distance=0..,type=marker] cse.status_effects.explosion_knockback_resistance.id run \
tag @s remove cse.status_effect.explosion_knockback_resistance.new

$attribute @s[tag=cse.status_effect.explosion_knockback_resistance.new] minecraft:explosion_knockback_resistance modifier add cse.status_effects.explosion_knockback_resistance.$(id).$(type) $(base) $(type)

tag @s remove cse.status_effect.explosion_knockback_resistance.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.explosion_knockback_resistance.data,tag=cse.status_effect.explosion_knockback_resistance.id.$(id),tag=cse.status_effect.explosion_knockback_resistance.$(type),distance=0..,type=marker] run \
tag @s add cse.status_effect.explosion_knockback_resistance.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.explosion_knockback_resistance.new] run \
function cse:status_effects/apply/explosion_knockback_resistance/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max), type:"$(type)"}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.explosion_knockback_resistance.new] \
    if entity @n[tag=cse.status_effect.explosion_knockback_resistance.data,tag=cse.status_effect.explosion_knockback_resistance.id.$(id),tag=cse.status_effect.explosion_knockback_resistance.$(type),distance=0..,type=marker] run \
function cse:status_effects/apply/explosion_knockback_resistance/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max), type:"$(type)"}

# Remove Tag
tag @s remove cse.status_effect.explosion_knockback_resistance.new

execute \
    if entity @s[tag=cse.status_effect.explosion_knockback_resistance] \
    if score @s cse.status_effects.explosion_knockback_resistance.base.value < @s cse.status_effects.explosion_knockback_resistance.value.max run \
scoreboard players operation @s cse.status_effects.explosion_knockback_resistance.base.value += @s cse.status_effects.explosion_knockback_resistance.value

execute \
    if entity @s[tag=cse.status_effect.explosion_knockback_resistance] \
    if score @s cse.status_effects.explosion_knockback_resistance.base.value >= @s cse.status_effects.explosion_knockback_resistance.value.max run \
scoreboard players operation @s cse.status_effects.explosion_knockback_resistance.base.value = @s cse.status_effects.explosion_knockback_resistance.value.max
tag @s add cse.status_effect.explosion_knockback_resistance

schedule function cse:status_effects/apply/explosion_knockback_resistance/main 1t