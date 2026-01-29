$execute \
    if entity @s[type=player] run \
summon marker ~ ~ ~ \
    { \
        Tags: \
            [ \
                "cse.status_effect.attack_damage.data", \
                "cse.status_effect.attack_damage.id.$(id)", \
                "summon" \
            ], \
        data: \
            { \
                cse: \
                    { \
                        id:"$(id)", \
                        attack_damage: \
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
                "cse.status_effect.attack_damage.data", \
                "cse.status_effect.attack_damage.id.$(id)", \
                "summon", \
                "cse.detect.death" \
            ], \
        data: \
            { \
                cse: \
                    { \
                        id:"$(id)", \
                        attack_damage: \
                            { \
                                base_value:$(base)f, \
                                value:$(value)f, \
                                max_value:$(max)f \
                            } \
                    } \
            } \
    }

scoreboard players operation @n[sort=arbitrary,tag=cse.status_effect.attack_damage.data,tag=summon,distance=0..,type=marker] cse.status_effects.attack_damage.id = @s cse.status_effects.attack_damage.id

execute \
    as @n[sort=arbitrary,tag=cse.status_effect.attack_damage.data,tag=summon,distance=0..,type=marker] run \
function cse:status_effects/apply/attack_damage/marker_data/add/2 with entity @s data.cse

$scoreboard players set @n[sort=arbitrary,tag=cse.status_effect.attack_damage.data,tag=summon,distance=0..,type=marker] cse.status_effects.attack_damage $(duration)

execute \
    unless entity @s[type=player] run \
ride @n[tag=cse.status_effect.attack_damage.data,tag=summon,distance=..3,tag=cse.detect.death,type=marker] mount @s

tag @n[tag=cse.status_effect.attack_damage.data,tag=summon,distance=0..,type=marker] remove summon