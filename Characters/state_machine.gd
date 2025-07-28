class_name StateMachine
extends Node


var _current_state: State
var _states : Dictionary[String, Node]

@export var _initial_state: State


func _ready() -> void:
	for child in self.get_children():
		if child is State:
			_states[child.name.to_lower()] = child
			child.transition_requested.connect(on_state_transition)
	
	if _initial_state:
		_initial_state.Enter()
		_current_state = _initial_state


func _process(delta: float) -> void:
	if _current_state:
		_current_state.Update(delta)


func _physics_process(delta: float) -> void:
	if _current_state:
		_current_state.Physics_update(delta)


func _unhandled_input(event: InputEvent) -> void:
	if _current_state:
		_current_state.Handle_input(event)


func on_state_transition(p_state: State, p_new_state_name: String, p_direction: Vector2):
	print(p_new_state_name)
	
	if p_state != _current_state:	# If the state is the same
		push_error(
			"Invalid on_state_transition! Trying from %s, but currently in: %s" %
			p_new_state_name %_current_state.name
		)
		return
	
	var new_state: State = _states.get(p_new_state_name.to_lower())
	if !new_state:	# If the new state doesn't exist
		push_error("Invalid on_state_transition! State '%s' not found!" % p_new_state_name)
		return
	
	# Switch states
	if _current_state:
		_current_state.Exit()
	new_state.set_direction(p_direction)
	new_state.Enter()
	_current_state = new_state
