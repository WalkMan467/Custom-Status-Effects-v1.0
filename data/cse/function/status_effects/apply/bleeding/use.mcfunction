tag @s add cse.status.effect.bleeding
$scoreboard players set @s cse.status_effects.bleeding $(duration)
$scoreboard players set @s cse.status_effects.bleeding.tr_max $(tick_rate)
$scoreboard players set @s cse.status_effects.bleeding.dot $(dot)
$scoreboard players set @s cse.status_effects.bleeding.dot_max $(max)

execute \
    unless score @s cse.status_effects.bleeding.tr_max matches 1.. run \
scoreboard players set @s cse.status_effects.bleeding.tr_max 1

execute \
    unless score @s cse.status_effects.bleeding.dot matches 1.. run \
scoreboard players set @s cse.status_effects.bleeding.dot 1

execute \
    unless score @s cse.status_effects.bleeding.dot_max matches 1.. run \
scoreboard players set @s cse.status_effects.bleeding.dot_max 1

scoreboard players operation @s cse.status_effects.bleeding.base_dot = @s cse.status_effects.bleeding.dot

scoreboard players operation @s cse.status_effects.bleeding.tr = @s cse.status_effects.bleeding.tr_max

schedule function cse:status_effects/apply/bleeding/main 1t