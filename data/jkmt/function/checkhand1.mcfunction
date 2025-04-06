# Multiply material value by 10 to make space for tool type
scoreboard players operation @s jkmt.mem *= #10 jkmt.mem

# Add tool type value based on the type in offhand
execute if items entity @s weapon.offhand #jkmt:type/axe run scoreboard players add @s jkmt.mem 1
execute if items entity @s weapon.offhand #jkmt:type/hoe run scoreboard players add @s jkmt.mem 2
execute if items entity @s weapon.offhand #jkmt:type/pickaxe run scoreboard players add @s jkmt.mem 3
execute if items entity @s weapon.offhand #jkmt:type/shovel run scoreboard players add @s jkmt.mem 4
# Removed sword detection
# execute if items entity @s weapon.offhand #jkmt:type/sword run scoreboard players add @s jkmt.mem 5

# Create a temporary display entity and copy item data into it
execute at @s run summon item_display ~ ~ ~ {Tags:["jkmt_display"]}
data modify entity @e[limit=1,type=item_display,tag=jkmt_display] item.id set from entity @s equipment.offhand.id
data modify entity @e[limit=1,type=item_display,tag=jkmt_display] item.components set from entity @s equipment.offhand.components

# Run the switch logic using the display entity
execute as @e[limit=1,type=item_display,tag=jkmt_display] run function jkmt:switch

# Finalize the switch by replacing the item
item replace entity @s weapon.offhand from entity @s weapon.mainhand
item replace entity @s weapon.mainhand from entity @e[limit=1,type=item_display,tag=jkmt_display] container.0

# Cleanup
kill @e[type=item_display,tag=jkmt_display]
