execute \
    as @e[sort=arbitrary,tag=cse.status_effect.armor_toughness.data,distance=0..,type=marker] at @s \
    if score @s cse.status_effects.armor_toughness.id = @n[sort=arbitrary,distance=0..,tag=cse.status.effect.clear,type=!#cse:dummy_mob] cse.status_effects.armor_toughness.id run \
function cse:status_effects/apply/armor_toughness/reset