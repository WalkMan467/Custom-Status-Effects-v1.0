execute \
    if score @s cse.status_effects.attack_damage.id = @n[sort=arbitrary,tag=!cse.status_effect.attack_damage.data_target.kill,tag=cse.status_effect.attack_damage.data,distance=0..,type=marker] cse.status_effects.attack_damage.id run \
return 0

tag @s remove cse.status_effect.attack_damage

scoreboard players set #reset.attack_damage cse.global.main 1