class_name CharacterMovement
extends Node
## Handles the movement of any 2D character

# iiiiiiiiiiiiiii CORE PROPERTIES iiiiiiiiiiiiiii

signal direction_changed

var _direction: Vector2

@export_range(1, 400, 0.2, "or_greater") var _speed: float = 100

@onready var _player:  = get_tree().get_first_node_in_group("player")	# Get the player in a top-down manner


func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	_move()
	_player.move_and_slide()


# iiiiiiiiiiiiiii PUBLIC API iiiiiiiiiiiiiii


func get_direction() -> Vector2:
	return _direction


func set_direction(p_direction : Vector2) -> void:
	if p_direction == _direction:		# If the direction is the same, then do nothing
		return
	if p_direction.x and p_direction.y: # Set only one direction at the time - closer to a gameboy feel
		# In another words reject the (1, 1) vector format
		return
	
	_direction = p_direction
	direction_changed.emit(_direction)


# iiiiiiiiiiiiiii INTERNAL LOGIC iiiiiiiiiiiiiii


func _move() -> void:
	_player.velocity = _direction * _speed
