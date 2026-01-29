execute \
    if score @s cse.status_effects.armor.id = @n[sort=arbitrary,tag=!cse.status_effect.armor.data_target.kill,tag=cse.status_effect.armor.data,distance=0..,type=marker] cse.status_effects.armor.id run \
return 0

tag @s remove cse.status_effect.armor

scoreboard players set #reset.armor cse.global.main 1