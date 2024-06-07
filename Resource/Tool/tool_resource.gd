class_name ToolResource
extends Resource

@export var toolList: Array[ToolData]

func get_size() -> int:
	return toolList.size()

func get_tool_list() -> Array[ToolData]:
	return toolList

