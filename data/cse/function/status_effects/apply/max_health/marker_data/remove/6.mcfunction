scoreboard objectives remove cse.status_effects.max_health
scoreboard objectives remove cse.status_effects.max_health.base.value
scoreboard objectives remove cse.status_effects.max_health.value
scoreboard objectives remove cse.status_effects.max_health.math
scoreboard objectives remove cse.status_effects.max_health.id

scoreboard objectives remove cse.status_effects.max_health.value.max
scoreboard players reset #reset.max_health cse.global.main

schedule clear cse:status_effects/apply/max_health/main