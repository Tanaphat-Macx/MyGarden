class_name VegetableResource
extends Resource

@export var vegetableList: Array[VegetableData]

func get_size() -> int:
	return vegetableList.size()

func get_vegetable_list() -> Array[VegetableData]:
	return vegetableList
