scoreboard objectives add cse.global.main dummy
scoreboard objectives add cse.entity.id dummy "[CSE] Entity ID"
scoreboard objectives add cse.detect.player.max_health dummy "[CSE] Player Max Health"
scoreboard objectives add cse.detect.player.health health "[CSE] Player Health"
scoreboard objectives add cse.detect.player.hurt_time dummy "[CSE] Player Hurt Time"
scoreboard objectives add cse.detect.player.death deathCount "[CSE] Player Death"
scoreboard objectives add cse.detect.player.leave minecraft.custom:leave_game "[CSE] Player Leave"
scoreboard objectives add cse.detect.damage_taken minecraft.custom:minecraft.damage_taken "[CSE] Dmg Taken"

function cse:status_effects/apply/bleeding/scoreboard

scoreboard players add $hide.reload.tips cse.global.main 0
scoreboard players set #abs cse.global.main -1