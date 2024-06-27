class_name StateMachine
extends Node

@export var inintial_state : State
var current_state: State
var states: Dictionary = {} #or var states: Array[State]

#Normal StateMachine SetUp
func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_finished.connect(on_state_finish)
			
	if inintial_state:
		inintial_state.enter_state()
		current_state = inintial_state
	
func _process(delta):
	if current_state:
		current_state.update_state(delta)

func _physics_process(delta):
	if current_state:
		current_state.physics_update_state(delta)
		print(current_state.name)

func on_state_finish(state, new_state_name):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
		
	if current_state:
		current_state.exit_state()
	
	new_state.enter_state()
	
	current_state = new_state



#func change_state(new_state: State):
	#if current_state is State:
		#current_state._exit_state()
	#new_state._enter_state()
	#current_state = new_state

