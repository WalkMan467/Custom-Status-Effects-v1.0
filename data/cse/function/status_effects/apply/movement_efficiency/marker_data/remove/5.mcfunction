execute \
    if score @s cse.status_effects.movement_efficiency.id = @n[sort=arbitrary,tag=!cse.status_effect.movement_efficiency.data_target.kill,tag=cse.status_effect.movement_efficiency.data,distance=0..,type=marker] cse.status_effects.movement_efficiency.id run \
return 0

tag @s remove cse.status_effect.movement_efficiency

scoreboard players set #reset.movement_efficiency cse.global.main 1