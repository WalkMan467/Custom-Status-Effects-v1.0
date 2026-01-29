scoreboard objectives remove cse.status_effects.spawn_reinforcements
scoreboard objectives remove cse.status_effects.spawn_reinforcements.base.value
scoreboard objectives remove cse.status_effects.spawn_reinforcements.value
scoreboard objectives remove cse.status_effects.spawn_reinforcements.math
scoreboard objectives remove cse.status_effects.spawn_reinforcements.id

scoreboard objectives remove cse.status_effects.spawn_reinforcements.value.max
scoreboard players reset #reset.spawn_reinforcements cse.global.main

schedule clear cse:status_effects/apply/spawn_reinforcements/main