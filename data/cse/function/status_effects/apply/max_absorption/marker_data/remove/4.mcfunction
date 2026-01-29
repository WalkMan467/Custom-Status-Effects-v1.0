scoreboard players reset @s cse.status_effects.max_absorption
scoreboard players reset @s cse.status_effects.max_absorption.base.value
scoreboard players reset @s cse.status_effects.max_absorption.value.max
scoreboard players reset @s cse.status_effects.max_absorption.value

function cse:status_effects/apply/max_absorption/marker_data/remove/5

$attribute @s minecraft:max_absorption modifier remove cse.status_effects.max_absorption.$(id)