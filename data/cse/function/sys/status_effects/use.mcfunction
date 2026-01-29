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

$loot replace entity @s weapon.mainhand loot {pools:[{rolls:1,entries:[{type:"minecraft:item",name:"minecraft:disc_fragment_5",functions:[{function:"minecraft:set_components",components:{"minecraft:tooltip_display":{hide_tooltip:1b}}},{function:"minecraft:set_custom_data",tag:{attribute:"$(attribute)",duration:$(duration),base:$(base),value:$(value),max:$(max),id:"$(id)"}}]}]}]}

item replace entity 00001076-0006-a026-ffff-f68bffcbeab6 weapon.mainhand from entity @s weapon.mainhand

data modify storage cse:temp data.status_effects append from entity 00001076-0006-a026-ffff-f68bffcbeab6 equipment.mainhand.components."minecraft:custom_data"

item replace entity @s weapon.mainhand from entity 00001076-0006-a026-ffff-f68bffcbeab6 weapon.offhand

kill 00001076-0006-a026-ffff-f68bffcbeab6

function cse:sys/status_effects/loop