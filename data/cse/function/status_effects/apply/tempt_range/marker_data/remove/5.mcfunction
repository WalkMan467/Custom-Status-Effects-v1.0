execute \
    if score @s cse.status_effects.tempt_range.id = @n[sort=arbitrary,tag=!cse.status_effect.tempt_range.data_target.kill,tag=cse.status_effect.tempt_range.data,distance=0..,type=marker] cse.status_effects.tempt_range.id run \
return 0

tag @s remove cse.status_effect.tempt_range

scoreboard players set #reset.tempt_range cse.global.main 1