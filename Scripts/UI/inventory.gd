extends PanelContainer


@export var slotScene: PackedScene
@export var seedResource : SeedResource

@onready var grid: GridContainer = $MarginContainer/Grid
@onready var select_texture: TextureRect = $MarginContainer/selectTexture

func _ready(): 
	grid.columns = seedResource.get_size()
	add_new_slot(seedResource.get_seed_list())


#Add slot from resource
func add_new_slot(seedArray: Array[SeedData]) -> void:
	for child in seedArray:
		instant_slot(child)
		
	var firstSlot = grid.get_child(0)

	Global_AutoLoad.emit_signal("seed_changed", firstSlot.seedDataResource)
	changed_selected_slot(firstSlot.position)


func _on_slot_selected(value) -> void:
	changed_selected_slot(value)

func changed_selected_slot(slot_pos) -> void:
	select_texture.position.x = slot_pos.x + $MarginContainer.get_theme_constant("margin_left")

func instant_slot(seedData: SeedData) -> void:
	var slot = slotScene.instantiate()
	grid.add_child(slot)
	slot.connect("slot_selected", _on_slot_selected)
	slot.setup(seedData)

func slot_empty(seedData: SeedData) -> void:
	for child in grid.get_children():
		if child.seedDataResource == seedData:
			child.play_flash_slot_empty()
