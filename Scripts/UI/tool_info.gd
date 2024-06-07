extends TextureRect

@onready var tool: TextureRect = $MarginContainer/tool


func set_tool_info(tool_texture: Texture) -> void:
	tool.texture = tool_texture
	
