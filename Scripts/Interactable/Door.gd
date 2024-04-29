class_name  Door
extends Area2D

@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
var door_open = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		#print("Detect")
		door_open = true
		Door()

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		door_open = false
		Door()
	
func Door():
	if door_open == true:
		animation_player.play("Door_open")
		await  animation_player.animation_finished
	else:
		animation_player.play_backwards("Door_open")
		await  animation_player.animation_finished
		


