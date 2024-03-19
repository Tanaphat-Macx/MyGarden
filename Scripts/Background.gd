extends ParallaxBackground

@onready var water_background: ParallaxLayer = $WaterBackground


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	water_background.motion_offset.x += 5 * delta
