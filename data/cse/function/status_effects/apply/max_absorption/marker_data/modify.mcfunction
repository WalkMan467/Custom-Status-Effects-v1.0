tag @s add cse.status_effect.max_absorption.data_target
tag @s add cse.status_effect.max_absorption.user

execute \
    as @e[tag=cse.status_effect.max_absorption.data,distance=0..,type=marker] \
    if score @s cse.status_effects.max_absorption.id = @n[tag=cse.status_effect.max_absorption.user,tag=cse.status_effect.max_absorption.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.max_absorption.id run \
tag @s add cse.status_effect.max_absorption.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.max_absorption.id.$(id),tag=cse.status_effect.max_absorption.data_target,tag=cse.status_effect.max_absorption.data,distance=0..,type=marker] run \
function cse:status_effects/apply/max_absorption/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:max_absorption modifier remove cse.status_effects.max_absorption.$(id)
data modify storage cse:status_effects max_absorption.final_value.value set from entity @n[tag=cse.status_effect.max_absorption.data,tag=cse.status_effect.max_absorption.data_target,distance=0..,type=marker] data.cse.max_absorption.base_value

$data modify storage cse:status_effects max_absorption.final_value.id set value "$(id)"
function cse:status_effects/apply/max_absorption/marker_data/merge with storage cse:status_effects max_absorption.final_value

data remove storage cse:status_effects max_absorption

tag @s remove cse.status_effect.max_absorption.data_target
tag @s remove cse.status_effect.max_absorption.user

tag @e[sort=arbitrary,tag=cse.status_effect.max_absorption.data_target,tag=cse.status_effect.max_absorption.data,distance=0..,type=marker] remove cse.status_effect.max_absorption.data_target