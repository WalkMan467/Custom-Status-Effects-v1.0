$execute \
    if entity @s[type=player] run \
summon marker ~ ~ ~ \
    { \
        Tags: \
            [ \
                "cse.status_effect.sweeping_damage_ratio.data", \
                "cse.status_effect.sweeping_damage_ratio.id.$(id)", \
                cse.status_effect.sweeping_damage_ratio.$(type), \
                "summon" \
            ], \
        data: \
            { \
                cse: \
                    { \
                        id:"$(id)", \
                        type:"$(type)", \
                        sweeping_damage_ratio: \
                            { \
                                base_value:$(base)f, \
                                value:$(value)f, \
                                max_value:$(max)f \
                            } \
                    } \
            } \
    }

$execute \
    unless entity @s[type=player] run \
summon marker ~ ~ ~ \
    {\
        Tags: \
            [ \
                "cse.status_effect.sweeping_damage_ratio.data", \
                "cse.status_effect.sweeping_damage_ratio.id.$(id)", \
                "cse.status_effect.sweeping_damage_ratio.$(type)", \
                "summon", \
                "cse.detect.death" \
            ], \
        data: \
            { \
                cse: \
                    { \
                        id:"$(id)", \
                        type:"$(type)", \
                        sweeping_damage_ratio: \
                            { \
                                base_value:$(base)f, \
                                value:$(value)f, \
                                max_value:$(max)f \
                            } \
                    } \
            } \
    }

scoreboard players operation @n[sort=arbitrary,tag=cse.status_effect.sweeping_damage_ratio.data,tag=summon,distance=0..,type=marker] cse.status_effects.sweeping_damage_ratio.id = @s cse.status_effects.sweeping_damage_ratio.id

execute \
    as @n[sort=arbitrary,tag=cse.status_effect.sweeping_damage_ratio.data,tag=summon,distance=0..,type=marker] run \
function cse:status_effects/apply/sweeping_damage_ratio/marker_data/add/2 with entity @s data.cse

$scoreboard players set @n[sort=arbitrary,tag=cse.status_effect.sweeping_damage_ratio.data,tag=summon,distance=0..,type=marker] cse.status_effects.sweeping_damage_ratio $(duration)

execute \
    unless entity @s[type=player] run \
ride @n[tag=cse.status_effect.sweeping_damage_ratio.data,tag=summon,distance=..3,tag=cse.detect.death,type=marker] mount @s

tag @n[tag=cse.status_effect.sweeping_damage_ratio.data,tag=summon,distance=0..,type=marker] remove summon