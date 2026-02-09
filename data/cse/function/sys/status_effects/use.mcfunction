$data modify storage temp2 data.type set value "$(type)"
$data modify storage temp2 data.attribute set value "$(attribute)"

tag @s add cse.detect.1
execute \
    unless data storage temp2 {data:{attribute:"armor"}} \
    unless data storage temp2 {data:{attribute:"armor_toughness"}} \
    unless data storage temp2 {data:{attribute:"attack_damage"}} \
    unless data storage temp2 {data:{attribute:"attack_knockback"}} \
    unless data storage temp2 {data:{attribute:"attack_speed"}} \
    unless data storage temp2 {data:{attribute:"block_break_speed"}} \
    unless data storage temp2 {data:{attribute:"block_interaction_range"}} \
    unless data storage temp2 {data:{attribute:"burning_time"}} \
    unless data storage temp2 {data:{attribute:"camera_distance"}} \
    unless data storage temp2 {data:{attribute:"entity_interaction_range"}} \
    unless data storage temp2 {data:{attribute:"explosion_knockback_resistance"}} \
    unless data storage temp2 {data:{attribute:"fall_damage_multiplier"}} \
    unless data storage temp2 {data:{attribute:"flying_speed"}} \
    unless data storage temp2 {data:{attribute:"follow_range"}} \
    unless data storage temp2 {data:{attribute:"gravity"}} \
    unless data storage temp2 {data:{attribute:"jump_strength"}} \
    unless data storage temp2 {data:{attribute:"knockback_resistance"}} \
    unless data storage temp2 {data:{attribute:"luck"}} \
    unless data storage temp2 {data:{attribute:"max_absorption"}} \
    unless data storage temp2 {data:{attribute:"max_health"}} \
    unless data storage temp2 {data:{attribute:"mining_efficiency"}} \
    unless data storage temp2 {data:{attribute:"movement_efficiency"}} \
    unless data storage temp2 {data:{attribute:"movement_speed"}} \
    unless data storage temp2 {data:{attribute:"oxygen_bonus"}} \
    unless data storage temp2 {data:{attribute:"safe_fall_distance"}} \
    unless data storage temp2 {data:{attribute:"scale"}} \
    unless data storage temp2 {data:{attribute:"sneaking_speed"}} \
    unless data storage temp2 {data:{attribute:"spawn_reinforcements"}} \
    unless data storage temp2 {data:{attribute:"step_height"}} \
    unless data storage temp2 {data:{attribute:"submerged_mining_speed"}} \
    unless data storage temp2 {data:{attribute:"sweeping_damage_ratio"}} \
    unless data storage temp2 {data:{attribute:"tempt_range"}} \
    unless data storage temp2 {data:{attribute:"water_movement_efficiency"}} \
    unless data storage temp2 {data:{attribute:"waypoint_receive_range"}} \
    unless data storage temp2 {data:{attribute:"waypoint_transmit_range"}} run \
tag @s remove cse.detect.1

tag @s add cse.detect.2
execute \
    unless data storage temp2 {data:{type:"add_value"}} \
    unless data storage temp2 {data:{type:"add_multiplied_base"}} \
    unless data storage temp2 {data:{type:"add_multiplied_total"}} run \
tag @s remove cse.detect.2

data remove storage minecraft:temp2 data

execute \
    unless entity @s[tag=cse.detect.1] run \
function cse:sys/status_effects/error/1

execute \
    unless entity @s[tag=cse.detect.1] run \
return 0

execute \
    unless entity @s[tag=cse.detect.2] run \
function cse:sys/status_effects/error/2

execute \
    unless entity @s[tag=cse.detect.2] run \
return 0

tag @s remove cse.detect.1
tag @s remove cse.detect.2
summon armor_stand ~ 255 ~ \
    { \
        ShowArms:1b, \
        UUID:[I;4214,434214,-2421,-3413322],\
        NoGravity:1b, \
        Silent:1b, \
        Invulnerable:1b, \
        Invisible:1b, \
        ShowArms:0b, \
        Small:1b, \
        Marker:1b, \
        NoBasePlate:1b, \
        attributes: \
            [ \
                { \
                    id:"minecraft:scale", \
                    base:0.0 \
                } \
            ], \
        DisabledSlots:4144959 \
    }

item replace entity 00001076-0006-a026-ffff-f68bffcbeab6 weapon.offhand from entity @s weapon.mainhand

$loot replace entity @s weapon.mainhand loot {pools:[{rolls:1,entries:[{type:"minecraft:item",name:"minecraft:disc_fragment_5",functions:[{function:"minecraft:set_components",components:{"minecraft:tooltip_display":{hide_tooltip:1b}}},{function:"minecraft:set_custom_data",tag:{attribute:"$(attribute)",duration:$(duration),base:$(base),value:$(value),max:$(max),id:"$(id)",type:"$(type)"}}]}]}]}

item replace entity 00001076-0006-a026-ffff-f68bffcbeab6 weapon.mainhand from entity @s weapon.mainhand

data modify storage cse:temp data.status_effects append from entity 00001076-0006-a026-ffff-f68bffcbeab6 equipment.mainhand.components."minecraft:custom_data"

# data remove storage temp2 data

item replace entity @s weapon.mainhand from entity 00001076-0006-a026-ffff-f68bffcbeab6 weapon.offhand

kill 00001076-0006-a026-ffff-f68bffcbeab6

function cse:sys/status_effects/loop