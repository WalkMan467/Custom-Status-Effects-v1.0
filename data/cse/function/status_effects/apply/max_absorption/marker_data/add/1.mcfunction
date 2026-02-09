$execute \
    if entity @s[type=player] run \
summon marker ~ ~ ~ \
    { \
        Tags: \
            [ \
                "cse.status_effect.max_absorption.data", \
                "cse.status_effect.max_absorption.id.$(id)", \
                cse.status_effect.max_absorption.$(type), \
                "summon" \
            ], \
        data: \
            { \
                cse: \
                    { \
                        id:"$(id)", \
                        type:"$(type)", \
                        max_absorption: \
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
                "cse.status_effect.max_absorption.data", \
                "cse.status_effect.max_absorption.id.$(id)", \
                "cse.status_effect.max_absorption.$(type)", \
                "summon", \
                "cse.detect.death" \
            ], \
        data: \
            { \
                cse: \
                    { \
                        id:"$(id)", \
                        type:"$(type)", \
                        max_absorption: \
                            { \
                                base_value:$(base)f, \
                                value:$(value)f, \
                                max_value:$(max)f \
                            } \
                    } \
            } \
    }

scoreboard players operation @n[sort=arbitrary,tag=cse.status_effect.max_absorption.data,tag=summon,distance=0..,type=marker] cse.status_effects.max_absorption.id = @s cse.status_effects.max_absorption.id

execute \
    as @n[sort=arbitrary,tag=cse.status_effect.max_absorption.data,tag=summon,distance=0..,type=marker] run \
function cse:status_effects/apply/max_absorption/marker_data/add/2 with entity @s data.cse

$scoreboard players set @n[sort=arbitrary,tag=cse.status_effect.max_absorption.data,tag=summon,distance=0..,type=marker] cse.status_effects.max_absorption $(duration)

execute \
    unless entity @s[type=player] run \
ride @n[tag=cse.status_effect.max_absorption.data,tag=summon,distance=..3,tag=cse.detect.death,type=marker] mount @s

tag @n[tag=cse.status_effect.max_absorption.data,tag=summon,distance=0..,type=marker] remove summon