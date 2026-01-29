scoreboard objectives remove cse.status_effects.jump_strength
scoreboard objectives remove cse.status_effects.jump_strength.base.value
scoreboard objectives remove cse.status_effects.jump_strength.value
scoreboard objectives remove cse.status_effects.jump_strength.math
scoreboard objectives remove cse.status_effects.jump_strength.id

scoreboard objectives remove cse.status_effects.jump_strength.value.max
scoreboard players reset #reset.jump_strength cse.global.main

schedule clear cse:status_effects/apply/jump_strength/main