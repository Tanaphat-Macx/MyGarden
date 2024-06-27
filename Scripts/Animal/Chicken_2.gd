extends CharacterBody2D
class_name  chicken

@onready var chicken: chicken = $"."

func _physics_process(delta: float) -> void:
	move_and_slide()

	if velocity.length() > 0:
		$AnimatedSprite2D.play("walk")
		
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
		
