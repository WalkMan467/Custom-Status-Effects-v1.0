scoreboard objectives remove cse.status_effects.burning_time
scoreboard objectives remove cse.status_effects.burning_time.base.value
scoreboard objectives remove cse.status_effects.burning_time.value
scoreboard objectives remove cse.status_effects.burning_time.math
scoreboard objectives remove cse.status_effects.burning_time.id

scoreboard objectives remove cse.status_effects.burning_time.value.max
scoreboard players reset #reset.burning_time cse.global.main

schedule clear cse:status_effects/apply/burning_time/main