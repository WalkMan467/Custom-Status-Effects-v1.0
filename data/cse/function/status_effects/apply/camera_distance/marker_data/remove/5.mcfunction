execute \
    if score @s cse.status_effects.camera_distance.id = @n[sort=arbitrary,tag=!cse.status_effect.camera_distance.data_target.kill,tag=cse.status_effect.camera_distance.data,distance=0..,type=marker] cse.status_effects.camera_distance.id run \
return 0

tag @s remove cse.status_effect.camera_distance

scoreboard players set #reset.camera_distance cse.global.main 1