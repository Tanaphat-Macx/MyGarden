class_name  Animal
extends CharacterBody2D

@export var animal_animation: AnimatedSprite2D
@onready var range_collision_shape_2d: CollisionShape2D = $Detect_Player/RangeCollisionShape2D
@onready var chicken: CharacterBody2D = $"."
@onready var chase_timer: Timer = $ChaseTimer

var speed = 30.0
var player_chase = false
var player = null

func _ready() -> void:
	var detect_range: int = randf_range(10, 15)
	range_collision_shape_2d.shape.radius = detect_range
	
func _physics_process(delta: float) -> void:
	if player_chase:
		position += (player.position - position) / speed
		animal_animation.play("walk")
		
		if(player.position.x - position.x) < 0:
			animal_animation.flip_h = true
		else:
			animal_animation.flip_h = false
	else:
		animal_animation.play("idle")

func _on_detect_player_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true
	chase_timer.start()
	print(chase_timer)

func _on_detect_player_body_exited(body: Node2D) -> void:
	player = body
	player_chase = null

func _on_chase_timer_timeout() -> void:
	range_collision_shape_2d.visible = true
	player_chase = null
	
