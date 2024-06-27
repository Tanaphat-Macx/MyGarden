extends State
class_name AnimalIdleState

var idle_timer: Timer
@export var animal: CharacterBody2D 
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

func enter_state():
	animal.velocity = Vector2.ZERO
	animated_sprite_2d.play("idle")
	
	idle_timer = Timer.new()
	idle_timer.wait_time = randi_range(3, 10)
	idle_timer.timeout.connect(on_timeout)
	idle_timer.autostart = true
	add_child(idle_timer)
	
func on_timeout():
	state_finished.emit(self, "wander")
	
func physics_update_state(delta: float) -> void:
	pass

func exit_state():
	idle_timer.stop()
	idle_timer.timeout.disconnect(on_timeout)
	#idle_timer.queue_free()
	idle_timer = null
