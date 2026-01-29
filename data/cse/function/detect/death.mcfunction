execute \
    unless score @s cse.detect.player.death matches 1.. run \
return 0

scoreboard players reset @s cse.detect.player.death

function cse:status_effects/apply/clear