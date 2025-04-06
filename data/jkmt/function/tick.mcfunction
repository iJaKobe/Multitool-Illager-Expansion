# Check tool state and store result in jkmt.mem
execute as @a store result score @s jkmt.mem run function jkmt:checkhand

# Check for multiple players using multitools
execute store result score #players jkmt.mem if entity @a[scores={jkmt.mem=1..}]
execute if score #players jkmt.mem matches 2.. run function jkmt:so_many

# Perform individual player multitool update
execute as @a[scores={jkmt.mem=1..}] run function jkmt:checkhand1
