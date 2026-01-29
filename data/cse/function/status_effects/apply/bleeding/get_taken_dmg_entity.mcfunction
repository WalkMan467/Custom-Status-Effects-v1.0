
execute \
    store result score #hp.max cse.status_effects.bleeding run \
attribute @s max_health get 10

execute \
    store result score #hp cse.status_effects.bleeding run \
data get entity @s Health 10

scoreboard players operation #hp.max cse.status_effects.bleeding -= #hp cse.status_effects.bleeding
scoreboard players operation @s cse.status_effects.bleeding.dot += #hp.max cse.status_effects.bleeding


execute \
    if score @s cse.status_effects.bleeding.dot > @s cse.status_effects.bleeding.dot_max run \
scoreboard players operation @s cse.status_effects.bleeding.dot = @s cse.status_effects.bleeding.dot_max