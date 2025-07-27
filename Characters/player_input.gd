class_name PlayerInput
extends Node

# iiiiiiiiiiiiiii CORE PROPERTIES iiiiiiiiiiiiiii

@export var actions: PlayerInputActions
@export var movement: CharacterMovement


func _process(delta: float) -> void:
	var player_direction = Input.get_vector(
		actions.left, actions.right, actions.up, actions.down
	)
	movement.set_direction(player_direction)


func _unhandled_input(event: InputEvent) -> void:
	pass
