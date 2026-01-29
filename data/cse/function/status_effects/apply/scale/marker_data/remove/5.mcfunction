execute \
    if score @s cse.status_effects.scale.id = @n[sort=arbitrary,tag=!cse.status_effect.scale.data_target.kill,tag=cse.status_effect.scale.data,distance=0..,type=marker] cse.status_effects.scale.id run \
return 0

tag @s remove cse.status_effect.scale

scoreboard players set #reset.scale cse.global.main 1