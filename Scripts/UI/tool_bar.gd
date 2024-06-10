extends PanelContainer


@export var toolSlotScene: PackedScene
@export var toolResource : ToolResource

@onready var grid: GridContainer = $MarginContainer/Grid
@onready var select_texture: TextureRect = $MarginContainer/selectTexture

func _ready(): 
	grid.columns = toolResource.get_size()
	add_new_slot(toolResource.get_tool_list())


#Add slot from resource  
#--> ready()
func add_new_slot(toolArray: Array[ToolData]) -> void:
	for child in toolArray:
		instant_slot(child)
		
	var firstSlot = grid.get_child(0)

	Global_AutoLoad.emit_signal("tool_changed", firstSlot.toolDataResource)
	changed_selected_slot(firstSlot.position)


#--> add_new_slot()
func changed_selected_slot(slot_pos) -> void:
	select_texture.position.x = slot_pos.x + $MarginContainer.get_theme_constant("margin_left")

#--> add_new_slot()
func instant_slot(toolData: ToolData) -> void:
	var slot = toolSlotScene.instantiate()
	grid.add_child(slot)
	slot.connect("tool_selected", _on_tool_selected)
	slot.setup(toolData)

#--> instant_slot()
func _on_tool_selected(value) -> void:
	changed_selected_slot(value)

#--> GridHelper 
#--> _on_player_plant_seed()
#func slot_empty(seedData: SeedData) -> void:
	#for child in grid.get_children():
		#if child.seedDataResource == seedData:
			#child.play_flash_slot_empty()
