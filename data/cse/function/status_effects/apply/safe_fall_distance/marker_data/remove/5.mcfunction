execute \
    if score @s cse.status_effects.safe_fall_distance.id = @n[sort=arbitrary,tag=!cse.status_effect.safe_fall_distance.data_target.kill,tag=cse.status_effect.safe_fall_distance.data,distance=0..,type=marker] cse.status_effects.safe_fall_distance.id run \
return 0

tag @s remove cse.status_effect.safe_fall_distance

scoreboard players set #reset.safe_fall_distance cse.global.main 1