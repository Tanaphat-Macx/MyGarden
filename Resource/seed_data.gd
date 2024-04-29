class_name SeedData
extends Resource

signal quanity_changed(new_quantity)

@export var vegetableDataResource: VegetableData
@export var vegetableScene: PackedScene

func seed_left() -> bool:
	return vegetableDataResource.quantity > 0
	
func add_quantity(value: int) -> void:
	if value > 0: 
		vegetableDataResource.quantity += value
		
func substract_quantity() -> void:
	if seed_left():
		vegetableDataResource.quantity -= 1
	quanity_changed.emit(vegetableDataResource.quantity)
	
func get_texture() -> Texture:
	return vegetableDataResource.texture
	
func get_quantity() -> int:
	return vegetableDataResource.quantity

func get_seed_name() -> String:
	return vegetableDataResource.get_vegetable_name()
	
