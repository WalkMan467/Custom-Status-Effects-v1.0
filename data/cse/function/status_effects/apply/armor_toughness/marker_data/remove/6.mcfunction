scoreboard objectives remove cse.status_effects.armor_toughness
scoreboard objectives remove cse.status_effects.armor_toughness.base.value
scoreboard objectives remove cse.status_effects.armor_toughness.value
scoreboard objectives remove cse.status_effects.armor_toughness.math
scoreboard objectives remove cse.status_effects.armor_toughness.id

scoreboard objectives remove cse.status_effects.armor_toughness.value.max
scoreboard players reset #reset.armor_toughness cse.global.main

schedule clear cse:status_effects/apply/armor_toughness/main