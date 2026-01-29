scoreboard objectives remove cse.status_effects.sweeping_damage_ratio
scoreboard objectives remove cse.status_effects.sweeping_damage_ratio.base.value
scoreboard objectives remove cse.status_effects.sweeping_damage_ratio.value
scoreboard objectives remove cse.status_effects.sweeping_damage_ratio.math
scoreboard objectives remove cse.status_effects.sweeping_damage_ratio.id

scoreboard objectives remove cse.status_effects.sweeping_damage_ratio.value.max
scoreboard players reset #reset.sweeping_damage_ratio cse.global.main

schedule clear cse:status_effects/apply/sweeping_damage_ratio/main