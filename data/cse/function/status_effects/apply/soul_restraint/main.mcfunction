execute as @e[sort=arbitrary,tag=cse.soul_restraint.display,distance=0..,type=item_display] at @s run \
function cse:status_effects/apply/soul_restraint/spear/guide

execute \
    if entity @n[sort=arbitrary,tag=cse.soul_restraint.display,distance=0..,type=item_display] run \
schedule function cse:status_effects/apply/soul_restraint/main 1t