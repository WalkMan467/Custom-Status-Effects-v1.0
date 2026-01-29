execute \
    if score @s cse.status_effects.luck.id = @n[sort=arbitrary,tag=!cse.status_effect.luck.data_target.kill,tag=cse.status_effect.luck.data,distance=0..,type=marker] cse.status_effects.luck.id run \
return 0

tag @s remove cse.status_effect.luck

scoreboard players set #reset.luck cse.global.main 1