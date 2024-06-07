class_name VegetableData
extends Resource

@export var vegetableNameResource: VegetableName

@export var texture: Texture:
	get:
		return texture
	set(value):
		texture = value
		
@export var quantity: int:
	get:
		return quantity
	set(value):
		quantity = value

# Return name # Use on function get_seed_name in SeedData
func get_vegetable_name() -> String:
	return vegetableNameResource.vegetableName
