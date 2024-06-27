class_name  State
extends Node

signal state_finished

#On transition to this state
#Execute some logic when the machine enters the state (initialize variables, trigger one-time actions, update current animation)
func enter_state() -> void:
	pass

#When leave this state
#Execute some logic when the machine exists the state (clean up resources, reset variables, remove nodes)
func exit_state() -> void:
	pass

#Every frame while active
#Execute some logic at every frame (equivalent to _process)
func update_state(_delta: float) -> void:
	pass

#Every physics tick while active
#Execute some logic at fixed intervals (equivalent to _physics_process)
func physics_update_state(_delta: float) -> void:
	pass
	
	
