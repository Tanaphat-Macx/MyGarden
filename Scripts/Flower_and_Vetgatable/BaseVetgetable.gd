class_name Vetgetable
extends Node2D

@export var amount: int = 2
@export var harvest_ready: bool = false

var index = 0

@onready var vetagetable_sprite_2d: Sprite2D = $Vetagetable_Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var grow_timer: Timer = $Grow_Timer

func  _ready() -> void:
	animation_player.play(str(index))
	
func _on_grow_timer_timeout() -> void:
	index += 1
	animation_player.play(str(index)) 
	
func harvest() -> void:
	queue_free()
