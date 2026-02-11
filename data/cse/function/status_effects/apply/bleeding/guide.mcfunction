
execute \
    if score @s cse.status_effects.bleeding matches 0.. run \
scoreboard players remove @s cse.status_effects.bleeding 1

execute \
    if score @s cse.status_effects.bleeding.tr matches 0.. run \
scoreboard players remove @s cse.status_effects.bleeding.tr 1


execute \
    if score @s cse.status_effects.bleeding matches 0.. \
    if score @s cse.status_effects.bleeding.dot > @s cse.status_effects.bleeding.dot_max run \
scoreboard players operation @s cse.status_effects.bleeding.dot = @s cse.status_effects.bleeding.dot_max


execute \
    if score @s cse.status_effects.bleeding.tr matches 0 run \
function cse:status_effects/apply/bleeding/tr_run