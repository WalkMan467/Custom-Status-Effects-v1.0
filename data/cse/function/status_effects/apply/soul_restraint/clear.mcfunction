tag @s add cse.soul_restraint.clear

execute \
    as @e[sort=arbitrary,tag=cse.soul_restraint.display,distance=..30,type=item_display] at @s \
    if score @s cse.status_effects.soul_restraint.id = @p[tag=cse.soul_restraint.clear,sort=arbitrary,distance=..30] cse.status_effects.soul_restraint.id run \
function cse:status_effects/apply/soul_restraint/spear/end

tag @s remove cse.soul_restraint.clear
tag @s remove cse.soul_restraint.user
tag @s remove cse.soul_restraint.target