execute \
    if score @s cse.status_effects.max_absorption.id = @n[sort=arbitrary,tag=!cse.status_effect.max_absorption.data_target.kill,tag=cse.status_effect.max_absorption.data,distance=0..,type=marker] cse.status_effects.max_absorption.id run \
return 0

tag @s remove cse.status_effect.max_absorption

scoreboard players set #reset.max_absorption cse.global.main 1