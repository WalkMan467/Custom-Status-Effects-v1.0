execute \
    if score @s cse.status_effects.follow_range.id = @n[sort=arbitrary,tag=!cse.status_effect.follow_range.data_target.kill,tag=cse.status_effect.follow_range.data,distance=0..,type=marker] cse.status_effects.follow_range.id run \
return 0

tag @s remove cse.status_effect.follow_range

scoreboard players set #reset.follow_range cse.global.main 1