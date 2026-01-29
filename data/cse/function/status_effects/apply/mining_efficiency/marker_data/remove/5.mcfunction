execute \
    if score @s cse.status_effects.mining_efficiency.id = @n[sort=arbitrary,tag=!cse.status_effect.mining_efficiency.data_target.kill,tag=cse.status_effect.mining_efficiency.data,distance=0..,type=marker] cse.status_effects.mining_efficiency.id run \
return 0

tag @s remove cse.status_effect.mining_efficiency

scoreboard players set #reset.mining_efficiency cse.global.main 1