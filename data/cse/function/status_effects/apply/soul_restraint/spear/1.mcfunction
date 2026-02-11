tag @s add cse.soul_restraint.display.point

execute \
    as @a at @s \
    if score @s cse.status_effects.soul_restraint.id = @n[sort=arbitrary,tag=cse.soul_restraint.display,tag=!cse.soul_restraint.target,tag=cse.soul_restraint.display.point,distance=..30,type=item_display] cse.status_effects.soul_restraint.id run \
tag @s add cse.soul_restraint.target

execute \
    if score @s cse.status_effects.soul_restraint.id = @p[tag=cse.soul_restraint.target,sort=arbitrary,distance=..30] cse.status_effects.soul_restraint.id run \
tag @s add cse.soul_restraint.point.target

execute \
facing entity @p[tag=cse.soul_restraint.target,sort=arbitrary,distance=..30] feet \
    positioned ~ ~1 ~ run \
function cse:status_effects/apply/soul_restraint/spear/raycast/use

scoreboard players reset @s cse.status_effects.soul_restraint.range

execute \
    positioned ~ ~0.5 ~ \
    rotated ~ 0 run \
function cse:status_effects/apply/soul_restraint/spear/range/rotate

execute \
    as @a[tag=cse.soul_restraint.target,distance=..30] at @s \
    if score @s cse.status_effects.soul_restraint.distance >= @s cse.status_effects.soul_restraint.max_range facing entity @n[sort=arbitrary,distance=..30,tag=cse.soul_restraint.point.target,tag=cse.soul_restraint.display.point,type=item_display] feet run \
tp @s ^ ^ ^0.25

tag @s remove cse.soul_restraint.display.point
tag @s remove cse.soul_restraint.point.target
tag @s remove cse.soul_restraint.target

tag @a[tag=cse.soul_restraint.target] remove cse.soul_restraint.target