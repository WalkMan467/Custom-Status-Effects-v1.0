execute \
    if score @s cse.status_effects.step_height.id = @n[sort=arbitrary,tag=!cse.status_effect.step_height.data_target.kill,tag=cse.status_effect.step_height.data,distance=0..,type=marker] cse.status_effects.step_height.id run \
return 0

tag @s remove cse.status_effect.step_height

scoreboard players set #reset.step_height cse.global.main 1