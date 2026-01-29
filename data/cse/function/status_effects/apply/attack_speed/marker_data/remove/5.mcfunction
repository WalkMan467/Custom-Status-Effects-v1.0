execute \
    if score @s cse.status_effects.attack_speed.id = @n[sort=arbitrary,tag=!cse.status_effect.attack_speed.data_target.kill,tag=cse.status_effect.attack_speed.data,distance=0..,type=marker] cse.status_effects.attack_speed.id run \
return 0

tag @s remove cse.status_effect.attack_speed

scoreboard players set #reset.attack_speed cse.global.main 1