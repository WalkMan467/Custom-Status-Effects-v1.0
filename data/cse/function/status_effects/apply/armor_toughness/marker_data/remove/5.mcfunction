execute \
    if score @s cse.status_effects.armor_toughness.id = @n[sort=arbitrary,tag=!cse.status_effect.armor_toughness.data_target.kill,tag=cse.status_effect.armor_toughness.data,distance=0..,type=marker] cse.status_effects.armor_toughness.id run \
return 0

tag @s remove cse.status_effect.armor_toughness

scoreboard players set #reset.armor_toughness cse.global.main 1