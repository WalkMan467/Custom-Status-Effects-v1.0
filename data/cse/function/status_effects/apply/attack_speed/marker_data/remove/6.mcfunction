scoreboard objectives remove cse.status_effects.attack_speed
scoreboard objectives remove cse.status_effects.attack_speed.base.value
scoreboard objectives remove cse.status_effects.attack_speed.value
scoreboard objectives remove cse.status_effects.attack_speed.math
scoreboard objectives remove cse.status_effects.attack_speed.id

scoreboard objectives remove cse.status_effects.attack_speed.value.max
scoreboard players reset #reset.attack_speed cse.global.main

schedule clear cse:status_effects/apply/attack_speed/main