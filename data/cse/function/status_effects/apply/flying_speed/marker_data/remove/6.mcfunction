scoreboard objectives remove cse.status_effects.flying_speed
scoreboard objectives remove cse.status_effects.flying_speed.base.value
scoreboard objectives remove cse.status_effects.flying_speed.value
scoreboard objectives remove cse.status_effects.flying_speed.math
scoreboard objectives remove cse.status_effects.flying_speed.id

scoreboard objectives remove cse.status_effects.flying_speed.value.max
scoreboard players reset #reset.flying_speed cse.global.main

schedule clear cse:status_effects/apply/flying_speed/main