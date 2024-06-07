extends HBoxContainer

@export var vetgetableItem: VegetableData
@export var seedItem: SeedData

func _ready() -> void:
	update_item_containers()

func initialize(vetgetable: VegetableData, seedData: SeedData) -> void:
	vetgetableItem = vetgetable
	seedItem = seedData
	update_item_containers()

func update_item_containers() -> void:
	update_ui($VetgetableInfo1, vetgetableItem.texture, vetgetableItem.quantity)
	update_ui($VetgetableInfo2, seedItem.get_texture(), seedItem.get_quantity())


	
func update_ui(node: Node, item_texture, item_quantity) -> void:
	node.set_item_info(item_texture, item_quantity)
	


func _on_texture_button_button_down() -> void:
	if vetgetableItem != null and seedItem != null:
		if vetgetableItem.quantity > 0:
			seedItem.add_quantity(vetgetableItem.quantity)
			vetgetableItem.quantity = 0
			update_item_containers()
		else:
			$VetgetableInfo1.play_flash_animation()
