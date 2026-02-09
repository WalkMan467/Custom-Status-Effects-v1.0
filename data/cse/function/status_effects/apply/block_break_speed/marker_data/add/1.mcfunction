$execute \
    if entity @s[type=player] run \
summon marker ~ ~ ~ \
    { \
        Tags: \
            [ \
                "cse.status_effect.block_break_speed.data", \
                "cse.status_effect.block_break_speed.id.$(id)", \
                cse.status_effect.block_break_speed.$(type), \
                "summon" \
            ], \
        data: \
            { \
                cse: \
                    { \
                        id:"$(id)", \
                        type:"$(type)", \
                        block_break_speed: \
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
                "cse.status_effect.block_break_speed.data", \
                "cse.status_effect.block_break_speed.id.$(id)", \
                "cse.status_effect.block_break_speed.$(type)", \
                "summon", \
                "cse.detect.death" \
            ], \
        data: \
            { \
                cse: \
                    { \
                        id:"$(id)", \
                        type:"$(type)", \
                        block_break_speed: \
                            { \
                                base_value:$(base)f, \
                                value:$(value)f, \
                                max_value:$(max)f \
                            } \
                    } \
            } \
    }

scoreboard players operation @n[sort=arbitrary,tag=cse.status_effect.block_break_speed.data,tag=summon,distance=0..,type=marker] cse.status_effects.block_break_speed.id = @s cse.status_effects.block_break_speed.id

execute \
    as @n[sort=arbitrary,tag=cse.status_effect.block_break_speed.data,tag=summon,distance=0..,type=marker] run \
function cse:status_effects/apply/block_break_speed/marker_data/add/2 with entity @s data.cse

$scoreboard players set @n[sort=arbitrary,tag=cse.status_effect.block_break_speed.data,tag=summon,distance=0..,type=marker] cse.status_effects.block_break_speed $(duration)

execute \
    unless entity @s[type=player] run \
ride @n[tag=cse.status_effect.block_break_speed.data,tag=summon,distance=..3,tag=cse.detect.death,type=marker] mount @s

tag @n[tag=cse.status_effect.block_break_speed.data,tag=summon,distance=0..,type=marker] remove summon