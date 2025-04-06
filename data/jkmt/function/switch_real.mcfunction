# Apply the updated item name based on selected tool and material
# Example result: netherite_pickaxe
$data modify entity @s item.id set value "$(material)_$(tool)"
