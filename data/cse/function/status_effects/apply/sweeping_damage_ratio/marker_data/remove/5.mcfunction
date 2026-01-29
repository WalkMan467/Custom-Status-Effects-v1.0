execute \
    if score @s cse.status_effects.sweeping_damage_ratio.id = @n[sort=arbitrary,tag=!cse.status_effect.sweeping_damage_ratio.data_target.kill,tag=cse.status_effect.sweeping_damage_ratio.data,distance=0..,type=marker] cse.status_effects.sweeping_damage_ratio.id run \
return 0

tag @s remove cse.status_effect.sweeping_damage_ratio

scoreboard players set #reset.sweeping_damage_ratio cse.global.main 1