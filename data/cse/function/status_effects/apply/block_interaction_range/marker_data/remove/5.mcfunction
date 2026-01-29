execute \
    if score @s cse.status_effects.block_interaction_range.id = @n[sort=arbitrary,tag=!cse.status_effect.block_interaction_range.data_target.kill,tag=cse.status_effect.block_interaction_range.data,distance=0..,type=marker] cse.status_effects.block_interaction_range.id run \
return 0

tag @s remove cse.status_effect.block_interaction_range

scoreboard players set #reset.block_interaction_range cse.global.main 1