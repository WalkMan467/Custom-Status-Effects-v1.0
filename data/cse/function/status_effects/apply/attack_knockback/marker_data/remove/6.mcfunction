scoreboard objectives remove cse.status_effects.attack_knockback
scoreboard objectives remove cse.status_effects.attack_knockback.base.value
scoreboard objectives remove cse.status_effects.attack_knockback.value
scoreboard objectives remove cse.status_effects.attack_knockback.math
scoreboard objectives remove cse.status_effects.attack_knockback.id

scoreboard objectives remove cse.status_effects.attack_knockback.value.max
scoreboard players reset #reset.attack_knockback cse.global.main

schedule clear cse:status_effects/apply/attack_knockback/main