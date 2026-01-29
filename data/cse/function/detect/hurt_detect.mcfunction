execute \
    if score @s cse.detect.player.hurt_time matches 1.. run \
scoreboard players remove @s cse.detect.player.hurt_time 1

scoreboard players add @s cse.status_effects.bleeding.health_temp 0
scoreboard players add @s cse.status_effects.bleeding.health 0

execute \
    store result score @s cse.status_effects.bleeding.max_health_temp run \
attribute @s max_health get 10

execute \
    store result score @s cse.status_effects.bleeding.health run \
data get entity @s Health 10


execute \
    if score @s cse.status_effects.bleeding.health >= @s cse.status_effects.bleeding.health_temp run \
scoreboard players operation @s cse.status_effects.bleeding.health_temp = @s cse.status_effects.bleeding.health

execute \
    if score @s cse.status_effects.bleeding.health_temp = @s cse.status_effects.bleeding.health run \
return 0

scoreboard players operation @s cse.status_effects.bleeding.health_temp -= @s cse.status_effects.bleeding.health

scoreboard players set @s cse.detect.player.hurt_time 10


execute \
    unless score #cse.status_effects.apply.dot? cse.global.main matches 1.. \
    if score @s cse.status_effects.bleeding matches 0.. run \
scoreboard players operation @s cse.status_effects.bleeding.dot += @s cse.status_effects.bleeding.health_temp

execute \
    if score #cse.status_effects.apply.dot? cse.global.main matches 1.. run \
scoreboard players reset #cse.status_effects.apply.dot? cse.global.main

scoreboard players operation @s cse.status_effects.bleeding.health_temp = @s cse.status_effects.bleeding.health

scoreboard players operation @s cse.status_effects.bleeding.max_health_temp = @s cse.status_effects.bleeding.health_temp