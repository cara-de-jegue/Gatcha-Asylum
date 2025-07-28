class_name State
extends Node

signal transition_requested(new_state_name: String)

var _direction: Vector2 = Vector2.DOWN
var _actions: PlayerInputActions = PlayerInputActions.new()

@export var _player: CharacterBody2D
@export var animation: AnimationPlayer

func Enter() -> void:
	pass


func Exit() -> void:
	pass


func Update(delta: float) -> void:
	pass


func Physics_update(delta: float) -> void:
	pass


func Handle_input(event: InputEvent) -> void:
	pass


func get_direction_name() -> String:
	match _direction:
		Vector2.DOWN:
			return "down"
		Vector2.UP:
			return "up"
		Vector2.LEFT:
			return "left"
		Vector2.RIGHT:
			return "right"
	
	return ""


func set_direction(p_direction: Vector2) -> void:
	if p_direction == _direction:		# If the direction is the same, then do nothing
		return
	
	_direction = p_direction
