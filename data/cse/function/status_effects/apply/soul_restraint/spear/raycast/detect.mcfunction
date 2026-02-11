
scoreboard players add #soul_restraint.raycast cse.global.main 1

# 特效

particle dust_color_transition{from_color:[0.000,1.000,0.733],to_color:[0.271,1.000,0.490],scale:0.375} ~ ~ ~ 0 0 0 0 0 normal @a

# 擊中敵人

execute as @p[distance=..1.05,tag=cse.soul_restraint.target,sort=arbitrary] run return run \
function cse:status_effects/apply/soul_restraint/spear/raycast/final

# 迴圈

execute positioned ^ ^ ^0.1 run function cse:status_effects/apply/soul_restraint/spear/raycast/detect