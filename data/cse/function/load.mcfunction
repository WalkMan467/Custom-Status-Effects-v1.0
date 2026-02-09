function cse:scoreobaord

forceload add 5123124 2413124 5123124 2413124

execute \
    positioned 5123124 0 2413124 \
    unless entity 00236b59-ffff-8272-fff9-b5020007fc94 run \
kill @e[distance=..1,type=marker]

summon marker 5123124 0 2413124 \
    { \
        Tags:["cse.global.data"], \
        UUID:[I; 2321241,-32142,-412414,523412], \
        CustomName: \
            { \
                "translate": \
                "cse.global.data", \
                fallback: \
                "[CSE] Global Data Marker" \
            } \
    }

execute \
    unless score $hide.reload.tips cse.global.main matches 1.. run \
tellraw @a[gamemode=creative] \
    [ \
        { \
            "text": \
            "[", \
            "color": "white" \
        }, \
        { \
            "text": \
            "WalkMan467", \
            "color": "gold" \
        }, \
        { \
            "text": \
            "]", \
            "color": "white" \
        }, \
        { \
            "text": \
            " ", \
            "color": "white" \
        }, \
        { \
            "text": \
            "Custom Status Effects is Reloaded!", \
            "color": "green" \
        } \
    ]

execute \
    unless score $cse.def_setup cse.global.main matches 1.. run \
function cse:setup