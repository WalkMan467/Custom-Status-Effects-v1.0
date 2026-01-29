$function cse:status_effects/apply/$(attribute)/main

$function cse:status_effects/apply/$(attribute)/scoreboard {attribute:"$(attribute)"}

$execute at @s run function cse:status_effects/apply/$(attribute)/use/at_guide with storage cse:temp data.status_effects[0]