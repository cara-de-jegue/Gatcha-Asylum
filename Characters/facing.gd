class_name CharacterAnimation
extends Node

# iiiiiiiiiiiiiii CORE PROPERTIES iiiiiiiiiiiiiii

var _FACING_DICT: Dictionary[Vector2, String] = {
	Vector2(0, -1): "up",
	Vector2(0, 1): "down",
	Vector2(-1, 0): "left",
	Vector2(1, 0): "right",
}

var _state: String = "idle"		# Garbage implementation of a state machine, but it'll do for now
var _facing: String = "down"

@export var movement: CharacterMovement
@export var animation: AnimationPlayer
@export var sprite: Sprite2D

func _ready() -> void:
	movement.direction_changed.connect(_update_animation)


# iiiiiiiiiiiiiii INTERNAL LOGIC iiiiiiiiiiiiiii


func _update_animation(p_direction: Vector2) -> void:
	_set_facing(p_direction)
	_set_state(p_direction)
	
	var animation_name = _state + "_" + _facing
	animation.play(animation_name)



func _set_facing(p_direction: Vector2) -> void:
	if p_direction == Vector2.ZERO:
		return
	else:
		_facing = _FACING_DICT[p_direction]


func _set_state(p_direction: Vector2) -> void:
	if p_direction == Vector2(0, 0):
		_state = "idle"
	else:
		_state = "walk"
