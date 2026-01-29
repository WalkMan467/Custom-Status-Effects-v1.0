execute \
    if score @s cse.status_effects.knockback_resistance.id = @n[sort=arbitrary,tag=!cse.status_effect.knockback_resistance.data_target.kill,tag=cse.status_effect.knockback_resistance.data,distance=0..,type=marker] cse.status_effects.knockback_resistance.id run \
return 0

tag @s remove cse.status_effect.knockback_resistance

scoreboard players set #reset.knockback_resistance cse.global.main 1