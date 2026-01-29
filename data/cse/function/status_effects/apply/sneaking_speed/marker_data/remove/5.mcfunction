execute \
    if score @s cse.status_effects.sneaking_speed.id = @n[sort=arbitrary,tag=!cse.status_effect.sneaking_speed.data_target.kill,tag=cse.status_effect.sneaking_speed.data,distance=0..,type=marker] cse.status_effects.sneaking_speed.id run \
return 0

tag @s remove cse.status_effect.sneaking_speed

scoreboard players set #reset.sneaking_speed cse.global.main 1