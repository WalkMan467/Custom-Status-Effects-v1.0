scoreboard objectives remove cse.status_effects.knockback_resistance
scoreboard objectives remove cse.status_effects.knockback_resistance.base.value
scoreboard objectives remove cse.status_effects.knockback_resistance.value
scoreboard objectives remove cse.status_effects.knockback_resistance.math
scoreboard objectives remove cse.status_effects.knockback_resistance.id

scoreboard objectives remove cse.status_effects.knockback_resistance.value.max
scoreboard players reset #reset.knockback_resistance cse.global.main

schedule clear cse:status_effects/apply/knockback_resistance/main