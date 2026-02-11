scoreboard players remove @s cse.global.main 1

execute \
    if score @s cse.global.main matches 1.. \
    positioned ^ ^ ^0.1 run return run \
function cse:status_effects/apply/soul_restraint/spear/range/detect

# final
scoreboard players reset @s cse.global.main
particle dust_color_transition{from_color:[0.000,1.000,0.733],to_color:[0.271,1.000,0.490],scale:0.75} ~ ~ ~ 0 0 0 0 0 normal @a