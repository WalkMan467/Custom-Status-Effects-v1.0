execute \
    if score @s cse.status_effects.spawn_reinforcements.id = @n[sort=arbitrary,tag=!cse.status_effect.spawn_reinforcements.data_target.kill,tag=cse.status_effect.spawn_reinforcements.data,distance=0..,type=marker] cse.status_effects.spawn_reinforcements.id run \
return 0

tag @s remove cse.status_effect.spawn_reinforcements

scoreboard players set #reset.spawn_reinforcements cse.global.main 1