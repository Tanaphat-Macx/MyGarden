class_name ToolData
extends Resource

@export var toolNameResource: ToolName

@export var texture: Texture:
	get:
		return texture
	set(value):
		texture = value
		
func get_tool_name() -> String:
	return toolNameResource.ToolName

