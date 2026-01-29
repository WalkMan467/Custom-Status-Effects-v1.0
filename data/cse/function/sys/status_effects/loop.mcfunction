# data
function cse:sys/status_effects/macro/main with storage cse:temp data.status_effects[0]

# loop
data remove storage cse:temp data.status_effects[0]

execute \
    if data storage cse:temp data.status_effects[0] run \
function cse:sys/status_effects/loop