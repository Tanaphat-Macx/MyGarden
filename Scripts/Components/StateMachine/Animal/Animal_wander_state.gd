class_name AnimalWanderState
extends State


@export var animal: CharacterBody2D
@export var move_speed := 10.0

var move_direction: Vector2
var wander_time: float
var player: CharacterBody2D

var idel_timer: Timer

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 3)
	
func back_to_idle():
	state_finished.emit(self, "Idle")
	
	
func enter_state():
	player = get_tree().get_first_node_in_group("player")
	randomize_wander()
	
	
func update_state(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander() or back_to_idle()
	

func physics_update_state(delta: float):
	if animal:
		animal.velocity = move_direction * move_speed
	
	var direction = player.global_position - animal.global_position
	if direction.length() < 30:
		state_finished.emit(self, "Follow")
		

