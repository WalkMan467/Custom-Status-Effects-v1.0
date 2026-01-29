execute \
    if score @s cse.status_effects.burning_time.id = @n[sort=arbitrary,tag=!cse.status_effect.burning_time.data_target.kill,tag=cse.status_effect.burning_time.data,distance=0..,type=marker] cse.status_effects.burning_time.id run \
return 0

tag @s remove cse.status_effect.burning_time

scoreboard players set #reset.burning_time cse.global.main 1