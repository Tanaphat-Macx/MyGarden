class_name ToolData
extends Resource

@export var toolNameResource: ToolName


func get_tool_name() -> String:
	return toolNameResource.ToolName

func get_texture() -> Texture:
	return toolNameResource.texture
