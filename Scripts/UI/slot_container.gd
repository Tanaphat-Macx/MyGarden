extends PanelContainer

signal slot_selected(slot_pos)

@onready var item_info: TextureRect = $ItemInfo

var seedDataResource: SeedData

func setup(value):
	seedDataResource = value
	seedDataResource.quanity_changed.connect(_on_quantity_changed)
	
	# Pull SeedData to use 
	item_info.set_item_info(seedDataResource.get_texture(), seedDataResource.get_quantity())

func _on_texture_button_button_down() -> void:
	if seedDataResource != null and seedDataResource.seed_left(): 
		Global_AutoLoad.emit_signal("seed_changed", seedDataResource)
		emit_signal("slot_selected", position)
		
func update_quantity() -> void:
	item_info.set_label(seedDataResource.get_quantity())

func _on_quantity_changed(new_quantity) -> void:
	item_info.set_label(new_quantity)

func play_flash_slot_empty() -> void:
	$ItemInfo.play_flash_animation()
	
	
