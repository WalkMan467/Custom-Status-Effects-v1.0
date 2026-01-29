tag @s add cse.status_effect.max_absorption.data_target.reset
tag @s add cse.status_effect.max_absorption.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.max_absorption,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.max_absorption.id = @n[sort=arbitrary,tag=cse.status_effect.max_absorption.data_target.reset,tag=cse.status_effect.max_absorption.id.$(id),tag=cse.status_effect.max_absorption.data,distance=0..,type=marker] cse.status_effects.max_absorption.id run \
function cse:status_effects/apply/max_absorption/marker_data/remove/4 {id:"$(id)"}