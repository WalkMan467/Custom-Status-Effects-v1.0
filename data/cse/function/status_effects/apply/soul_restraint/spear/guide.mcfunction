scoreboard players remove @s cse.status_effects.soul_restraint.display.duration 1
scoreboard players add @s cse.status_effects.soul_restraint.display.timer 1

execute if score @s cse.status_effects.soul_restraint.display.duration matches ..1 run \
function cse:status_effects/apply/soul_restraint/spear/end

execute if score @s cse.status_effects.soul_restraint.display.timer matches 1 run \
function cse:status_effects/apply/soul_restraint/spear/0

execute if score @s cse.status_effects.soul_restraint.display.timer matches 1.. run \
function cse:status_effects/apply/soul_restraint/spear/1

execute if score @s cse.status_effects.soul_restraint.display.timer matches 5 run \
function cse:status_effects/apply/soul_restraint/spear/2