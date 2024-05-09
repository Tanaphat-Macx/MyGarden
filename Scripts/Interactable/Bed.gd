extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var canvas_layer: CanvasLayer = $AnimationPlayer/CanvasLayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_sleep")
	#canvas_layer.hide()

func _on_sleep():
	print("test")
	animation_player.play("bed")
	await  animation_player.animation_finished
	animation_player.play_backwards("bed")
	
