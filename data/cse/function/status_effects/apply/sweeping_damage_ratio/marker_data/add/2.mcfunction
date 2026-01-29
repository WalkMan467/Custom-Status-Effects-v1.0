function cse:cull/uuid

$data modify storage cse:status_effects.id.uuid temp.id set value "$(id)"

function cse:status_effects/apply/sweeping_damage_ratio/marker_data/add/3 with storage cse:status_effects.id.uuid temp