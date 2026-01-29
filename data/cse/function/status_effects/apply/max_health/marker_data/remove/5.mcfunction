execute \
    if score @s cse.status_effects.max_health.id = @n[sort=arbitrary,tag=!cse.status_effect.max_health.data_target.kill,tag=cse.status_effect.max_health.data,distance=0..,type=marker] cse.status_effects.max_health.id run \
return 0

tag @s remove cse.status_effect.max_health

scoreboard players set #reset.max_health cse.global.main 1