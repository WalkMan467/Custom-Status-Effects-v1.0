execute \
    if score @s cse.status_effects.block_break_speed.id = @n[sort=arbitrary,tag=!cse.status_effect.block_break_speed.data_target.kill,tag=cse.status_effect.block_break_speed.data,distance=0..,type=marker] cse.status_effects.block_break_speed.id run \
return 0

tag @s remove cse.status_effect.block_break_speed

scoreboard players set #reset.block_break_speed cse.global.main 1