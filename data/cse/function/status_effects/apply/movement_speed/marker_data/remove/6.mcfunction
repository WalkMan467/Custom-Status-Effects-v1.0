scoreboard objectives remove cse.status_effects.movement_speed
scoreboard objectives remove cse.status_effects.movement_speed.base.value
scoreboard objectives remove cse.status_effects.movement_speed.value
scoreboard objectives remove cse.status_effects.movement_speed.math
scoreboard objectives remove cse.status_effects.movement_speed.id

scoreboard objectives remove cse.status_effects.movement_speed.value.max
scoreboard players reset #reset.movement_speed cse.global.main

schedule clear cse:status_effects/apply/movement_speed/main