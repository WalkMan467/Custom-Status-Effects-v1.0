execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.detect.death,type=marker] \
    on vehicle \
    unless data entity @s {DeathTime:0s} at @s run \
function cse:detect/death_monster

execute \
    as @e[sort=arbitrary,distance=0..,type=!#cse:dummy_mob] at @s run \
function cse:detect/hurt_detect

execute \
    as @a at @s run \
function cse:player