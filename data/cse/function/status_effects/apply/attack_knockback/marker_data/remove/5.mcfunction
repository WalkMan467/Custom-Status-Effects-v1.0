execute \
    if score @s cse.status_effects.attack_knockback.id = @n[sort=arbitrary,tag=!cse.status_effect.attack_knockback.data_target.kill,tag=cse.status_effect.attack_knockback.data,distance=0..,type=marker] cse.status_effects.attack_knockback.id run \
return 0

tag @s remove cse.status_effect.attack_knockback

scoreboard players set #reset.attack_knockback cse.global.main 1