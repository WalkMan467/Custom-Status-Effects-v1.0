execute \
    if score @s cse.status_effects.flying_speed.id = @n[sort=arbitrary,tag=!cse.status_effect.flying_speed.data_target.kill,tag=cse.status_effect.flying_speed.data,distance=0..,type=marker] cse.status_effects.flying_speed.id run \
return 0

tag @s remove cse.status_effect.flying_speed

scoreboard players set #reset.flying_speed cse.global.main 1