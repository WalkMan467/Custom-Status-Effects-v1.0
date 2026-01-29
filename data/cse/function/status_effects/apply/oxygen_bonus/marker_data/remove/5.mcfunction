execute \
    if score @s cse.status_effects.oxygen_bonus.id = @n[sort=arbitrary,tag=!cse.status_effect.oxygen_bonus.data_target.kill,tag=cse.status_effect.oxygen_bonus.data,distance=0..,type=marker] cse.status_effects.oxygen_bonus.id run \
return 0

tag @s remove cse.status_effect.oxygen_bonus

scoreboard players set #reset.oxygen_bonus cse.global.main 1