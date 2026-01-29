execute \
    if score @s cse.status_effects.gravity.id = @n[sort=arbitrary,tag=!cse.status_effect.gravity.data_target.kill,tag=cse.status_effect.gravity.data,distance=0..,type=marker] cse.status_effects.gravity.id run \
return 0

tag @s remove cse.status_effect.gravity

scoreboard players set #reset.gravity cse.global.main 1