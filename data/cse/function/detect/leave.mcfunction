execute \
    unless score @s cse.detect.player.leave matches 1.. run \
return 0

scoreboard players reset @s cse.detect.player.leave

function cse:status_effects/apply/clear

execute \
    if entity @s[tag=cse.status.effect.bleeding] run \
schedule function cse:status_effects/apply/bleeding/main 1t