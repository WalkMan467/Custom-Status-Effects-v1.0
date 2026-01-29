$execute \
    if entity @s[type=player] run \
summon marker ~ ~ ~ \
    { \
        Tags: \
            [ \
                "cse.status_effect.jump_strength.data", \
                "cse.status_effect.jump_strength.id.$(id)", \
                "summon" \
            ], \
        data: \
            { \
                cse: \
                    { \
                        id:"$(id)", \
                        jump_strength: \
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
                "cse.status_effect.jump_strength.data", \
                "cse.status_effect.jump_strength.id.$(id)", \
                "summon", \
                "cse.detect.death" \
            ], \
        data: \
            { \
                cse: \
                    { \
                        id:"$(id)", \
                        jump_strength: \
                            { \
                                base_value:$(base)f, \
                                value:$(value)f, \
                                max_value:$(max)f \
                            } \
                    } \
            } \
    }

scoreboard players operation @n[sort=arbitrary,tag=cse.status_effect.jump_strength.data,tag=summon,distance=0..,type=marker] cse.status_effects.jump_strength.id = @s cse.status_effects.jump_strength.id

execute \
    as @n[sort=arbitrary,tag=cse.status_effect.jump_strength.data,tag=summon,distance=0..,type=marker] run \
function cse:status_effects/apply/jump_strength/marker_data/add/2 with entity @s data.cse

$scoreboard players set @n[sort=arbitrary,tag=cse.status_effect.jump_strength.data,tag=summon,distance=0..,type=marker] cse.status_effects.jump_strength $(duration)

execute \
    unless entity @s[type=player] run \
ride @n[tag=cse.status_effect.jump_strength.data,tag=summon,distance=..3,tag=cse.detect.death,type=marker] mount @s

tag @n[tag=cse.status_effect.jump_strength.data,tag=summon,distance=0..,type=marker] remove summon