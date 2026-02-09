# ID Register

execute \
    unless score @s cse.status_effects.attack_knockback.id matches -2147483648..2147483647 run \
scoreboard players add #global cse.status_effects.attack_knockback.id 1

execute \
    unless score @s cse.status_effects.attack_knockback.id matches -2147483648..2147483647 run \
scoreboard players operation @s cse.status_effects.attack_knockback.id = #global cse.status_effects.attack_knockback.id

# Status Effects Base Value

tag @s add cse.status_effect.attack_knockback.new

$execute \
    if score @s cse.status_effects.attack_knockback.id = @n[tag=cse.status_effect.attack_knockback.data,tag=cse.status_effect.attack_knockback.id.$(id),tag=cse.status_effect.attack_knockback.$(type),distance=0..,type=marker] cse.status_effects.attack_knockback.id run \
tag @s remove cse.status_effect.attack_knockback.new

$attribute @s[tag=cse.status_effect.attack_knockback.new] minecraft:attack_knockback modifier add cse.status_effects.attack_knockback.$(id).$(type) $(base) $(type)

tag @s remove cse.status_effect.attack_knockback.new

# Detect if there are duplicate IDs
$execute \
    unless entity @n[tag=cse.status_effect.attack_knockback.data,tag=cse.status_effect.attack_knockback.id.$(id),tag=cse.status_effect.attack_knockback.$(type),distance=0..,type=marker] run \
tag @s add cse.status_effect.attack_knockback.new

# Call function using the result
$execute \
    if entity @s[tag=cse.status_effect.attack_knockback.new] run \
function cse:status_effects/apply/attack_knockback/marker_data/add/1 {id:"$(id)", duration:$(duration), base:$(base), value:$(value), max:$(max), type:"$(type)"}

# Multiple applications of the same state effect were detected ; the modify function was invoked
$execute \
    unless entity @s[tag=cse.status_effect.attack_knockback.new] \
    if entity @n[tag=cse.status_effect.attack_knockback.data,tag=cse.status_effect.attack_knockback.id.$(id),tag=cse.status_effect.attack_knockback.$(type),distance=0..,type=marker] run \
function cse:status_effects/apply/attack_knockback/marker_data/modify {id:"$(id)", duration:$(duration), value:$(value), max:$(max), type:"$(type)"}

# Remove Tag
tag @s remove cse.status_effect.attack_knockback.new

execute \
    if entity @s[tag=cse.status_effect.attack_knockback] \
    if score @s cse.status_effects.attack_knockback.base.value < @s cse.status_effects.attack_knockback.value.max run \
scoreboard players operation @s cse.status_effects.attack_knockback.base.value += @s cse.status_effects.attack_knockback.value

execute \
    if entity @s[tag=cse.status_effect.attack_knockback] \
    if score @s cse.status_effects.attack_knockback.base.value >= @s cse.status_effects.attack_knockback.value.max run \
scoreboard players operation @s cse.status_effects.attack_knockback.base.value = @s cse.status_effects.attack_knockback.value.max
tag @s add cse.status_effect.attack_knockback

schedule function cse:status_effects/apply/attack_knockback/main 1t