scoreboard objectives remove cse.status_effects.block_break_speed
scoreboard objectives remove cse.status_effects.block_break_speed.base.value
scoreboard objectives remove cse.status_effects.block_break_speed.value
scoreboard objectives remove cse.status_effects.block_break_speed.math
scoreboard objectives remove cse.status_effects.block_break_speed.id

scoreboard objectives remove cse.status_effects.block_break_speed.value.max
scoreboard players reset #reset.block_break_speed cse.global.main

schedule clear cse:status_effects/apply/block_break_speed/main