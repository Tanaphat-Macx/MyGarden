class_name MoveComponent
extends CharacterBody2D

signal plantSeed
signal stop_walk
signal walk


@export var speed: float
@export var animation_tree: AnimationTree 
@export var sprite_Character2D: CharacterBody2D

var direction = Vector2.ZERO

func _ready() -> void:
	animation_tree.active = true
	
func _process(delta: float) -> void:
	update_aimation_parameter()

func _physics_process(delta: float) -> void:
	# Move in 4 directions
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	
	if direction:
		velocity = direction * speed
		emit_signal("walk")		
	else:
		emit_signal("stop_walk")
		velocity = Vector2.ZERO
		
	
	if(Input.is_action_just_pressed("plant_Seed")):
		#plantSeed.emit()
		emit_signal("plantSeed")

	move_and_slide()

func update_aimation_parameter():
	# Find path at "AnimationTree Inspector -> Parameters -> Conditions
	if(velocity == Vector2.ZERO):
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true
	
	if(velocity != Vector2.ZERO):
		animation_tree["parameters/Idel/blend_position"] = direction
		animation_tree["parameters/walk/blend_position"] = direction
	
