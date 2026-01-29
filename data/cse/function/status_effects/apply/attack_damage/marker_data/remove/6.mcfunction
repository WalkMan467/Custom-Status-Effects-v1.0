scoreboard objectives remove cse.status_effects.attack_damage
scoreboard objectives remove cse.status_effects.attack_damage.base.value
scoreboard objectives remove cse.status_effects.attack_damage.value
scoreboard objectives remove cse.status_effects.attack_damage.math
scoreboard objectives remove cse.status_effects.attack_damage.id

scoreboard objectives remove cse.status_effects.attack_damage.value.max
scoreboard players reset #reset.attack_damage cse.global.main

schedule clear cse:status_effects/apply/attack_damage/main