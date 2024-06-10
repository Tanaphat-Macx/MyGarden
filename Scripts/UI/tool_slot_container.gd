extends PanelContainer
signal tool_selected(tool_pos)

@onready var tool_info: TextureRect = $toolInfo

var toolDataResource: ToolData

#--> ToolBar
func setup(value):
	toolDataResource = value
	
	# Pull from ToolData to use 
	tool_info.set_tool_info(toolDataResource.get_texture())


func _on_texture_button_button_down() -> void:
	if toolDataResource != null: # and seedDataResource.seed_left(): 
		Global_AutoLoad.emit_signal("tool_changed", toolDataResource)
		emit_signal("tool_selected", position)

