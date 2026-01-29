execute \
    if score @s cse.status_effects.movement_speed.id = @n[sort=arbitrary,tag=!cse.status_effect.movement_speed.data_target.kill,tag=cse.status_effect.movement_speed.data,distance=0..,type=marker] cse.status_effects.movement_speed.id run \
return 0

tag @s remove cse.status_effect.movement_speed

scoreboard players set #reset.movement_speed cse.global.main 1