
execute \
    unless score @s cse.status_effects.bleeding matches 0.. run \
return 0

execute \
    if score #cse.status_effects.apply.dot? cse.global.main matches 1.. run \
return 0


execute \
    if entity @s[type=!player] run \
function cse:status_effects/apply/bleeding/get_taken_dmg_entity


execute \
    if entity @s[type=player] run \
scoreboard players operation @s cse.status_effects.bleeding.dot += @s cse.detect.damage_taken


execute \
    unless score #cse.status_effects.apply.dot? cse.global.main matches 1.. \
    if score @s cse.status_effects.bleeding.dot > @s cse.status_effects.bleeding.dot_max run \
scoreboard players operation @s cse.status_effects.bleeding.dot = @s cse.status_effects.bleeding.dot_max

scoreboard players reset @s cse.detect.damage_taken