execute \
    if score @s cse.status_effects.jump_strength.id = @n[sort=arbitrary,tag=!cse.status_effect.jump_strength.data_target.kill,tag=cse.status_effect.jump_strength.data,distance=0..,type=marker] cse.status_effects.jump_strength.id run \
return 0

tag @s remove cse.status_effect.jump_strength

scoreboard players set #reset.jump_strength cse.global.main 1