extends State
class_name AnimalFollowState

@export var animal: CharacterBody2D
@export var move_speed := 15

var player: CharacterBody2D

func enter_state():
	player = get_tree().get_first_node_in_group("player")

	
func physics_update_state(delta: float):
	var direction = player.global_position - animal.global_position
	
	if direction.length() > 25:
		animal.velocity = direction.normalized() * move_speed
	else:
		animal.velocity = Vector2()

	if direction.length() > 50:
		state_finished.emit(self, "Wander")
