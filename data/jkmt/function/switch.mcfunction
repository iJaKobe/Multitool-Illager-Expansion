# Begin switching logic

# Get tens digit (material type)
scoreboard players operation #temp1 jkmt.mem = @p[scores={jkmt.mem=1..}] jkmt.mem
scoreboard players operation #temp1 jkmt.mem /= #10 jkmt.mem

# Get ones digit (tool type)
scoreboard players operation #temp0 jkmt.mem = @p[scores={jkmt.mem=1..}] jkmt.mem
scoreboard players operation #temp0 jkmt.mem %= #10 jkmt.mem
scoreboard players add #temp0 jkmt.mem 1
execute if score #temp0 jkmt.mem matches 5.. run scoreboard players set #temp0 jkmt.mem 1

# Set material type in storage
execute if score #temp1 jkmt.mem matches 6 run data modify storage jkmt:data material set value "netherite"
execute if score #temp1 jkmt.mem matches 7 run data modify storage jkmt:data material set value "illagerexp:platinum_infused_netherite"

# Set tool type in storage
execute if score #temp0 jkmt.mem matches 1 run data modify storage jkmt:data tool set value "axe"
execute if score #temp0 jkmt.mem matches 2 run data modify storage jkmt:data tool set value "hoe"
execute if score #temp0 jkmt.mem matches 3 run data modify storage jkmt:data tool set value "pickaxe"
execute if score #temp0 jkmt.mem matches 4 run data modify storage jkmt:data tool set value "shovel"
# Removed sword mode

# Apply the selected tool and material mode
function jkmt:switch_real with storage jkmt:data
