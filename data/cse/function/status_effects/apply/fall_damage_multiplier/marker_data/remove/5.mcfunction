execute \
    if score @s cse.status_effects.fall_damage_multiplier.id = @n[sort=arbitrary,tag=!cse.status_effect.fall_damage_multiplier.data_target.kill,tag=cse.status_effect.fall_damage_multiplier.data,distance=0..,type=marker] cse.status_effects.fall_damage_multiplier.id run \
return 0

tag @s remove cse.status_effect.fall_damage_multiplier

scoreboard players set #reset.fall_damage_multiplier cse.global.main 1