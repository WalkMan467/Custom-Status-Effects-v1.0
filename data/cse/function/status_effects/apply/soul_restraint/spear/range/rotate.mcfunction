
scoreboard players add @s cse.status_effects.soul_restraint.range 3
execute if score @s cse.status_effects.soul_restraint.range matches 360.. run return fail

function cse:status_effects/apply/soul_restraint/spear/range/use
execute rotated ~3 0 run function cse:status_effects/apply/soul_restraint/spear/range/rotate