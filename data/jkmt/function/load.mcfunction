scoreboard objectives remove jkmt.mem
scoreboard objectives add jkmt.mem dummy
scoreboard players set #10 jkmt.mem 10

# Display welcome messages to players
tellraw @p [{ "text": "Modern Multitools Netherite+ ", "color": "green" }, { "text": "Illager Expansion Compatibility", "color": "gold" }]
