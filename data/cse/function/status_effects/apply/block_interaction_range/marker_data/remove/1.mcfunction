# Capture UUID
function cse:cull/uuid
scoreboard players reset #reset.block_interaction_range cse.global.main

# Grab the UUID and ID start merging the strings and remove specific scores
#   @s = Status Effects Marker
#   Naming conventions: "[id] Status Effects Marker UUID"

$data modify storage cse:status_effects.id.uuid temp.id set value "$(id)"
$data modify storage cse:status_effects.id.uuid temp.type set value "$(type)"

function cse:status_effects/apply/block_interaction_range/marker_data/remove/2 with storage cse:status_effects.id.uuid temp

# Reference the "ID" macro in the function
# And perform data deletion on the player affected by the status
function cse:status_effects/apply/block_interaction_range/marker_data/remove/3 with storage cse:status_effects.id.uuid temp

execute \
    if score #reset.block_interaction_range cse.global.main matches 1 run \
function cse:status_effects/apply/block_interaction_range/marker_data/remove/6