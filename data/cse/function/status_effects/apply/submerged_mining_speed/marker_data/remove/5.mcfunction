execute \
    if score @s cse.status_effects.submerged_mining_speed.id = @n[sort=arbitrary,tag=!cse.status_effect.submerged_mining_speed.data_target.kill,tag=cse.status_effect.submerged_mining_speed.data,distance=0..,type=marker] cse.status_effects.submerged_mining_speed.id run \
return 0

tag @s remove cse.status_effect.submerged_mining_speed

scoreboard players set #reset.submerged_mining_speed cse.global.main 1