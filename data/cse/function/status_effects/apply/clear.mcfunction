tag @s add cse.status.effect.clear

function cse:status_effects/apply/movement_speed/clear
function cse:status_effects/apply/armor/clear
function cse:status_effects/apply/attack_damage/clear
function cse:status_effects/apply/jump_strength/clear
function cse:status_effects/apply/attack_speed/clear
function cse:status_effects/apply/armor_toughness/clear
function cse:status_effects/apply/attack_knockback/clear
function cse:status_effects/apply/block_break_speed/clear
function cse:status_effects/apply/block_interaction_range/clear
function cse:status_effects/apply/burning_time/clear
function cse:status_effects/apply/camera_distance/clear
function cse:status_effects/apply/entity_interaction_range/clear
function cse:status_effects/apply/explosion_knockback_resistance/clear
function cse:status_effects/apply/fall_damage_multiplier/clear
function cse:status_effects/apply/flying_speed/clear
function cse:status_effects/apply/gravity/clear
function cse:status_effects/apply/knockback_resistance/clear
function cse:status_effects/apply/luck/clear
function cse:status_effects/apply/max_absorption/clear
function cse:status_effects/apply/max_health/clear
function cse:status_effects/apply/mining_efficiency/clear
function cse:status_effects/apply/movement_efficiency/clear
function cse:status_effects/apply/oxygen_bonus/clear
function cse:status_effects/apply/safe_fall_distance/clear
function cse:status_effects/apply/scale/clear
function cse:status_effects/apply/sneaking_speed/clear
function cse:status_effects/apply/spawn_reinforcements/clear
function cse:status_effects/apply/step_height/clear
function cse:status_effects/apply/submerged_mining_speed/clear
function cse:status_effects/apply/sweeping_damage_ratio/clear
function cse:status_effects/apply/tempt_range/clear
function cse:status_effects/apply/water_movement_efficiency/clear
function cse:status_effects/apply/waypoint_receive_range/clear
function cse:status_effects/apply/waypoint_transmit_range/clear
function cse:status_effects/apply/bleeding/clear
function cse:status_effects/apply/soul_restraint/clear

tag @s remove cse.status.effect.clear

execute \
    on passengers run \
kill @s[type=marker,tag=cse.detect.death]