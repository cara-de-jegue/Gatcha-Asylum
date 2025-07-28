class_name PlayerWalk
extends State


@export var walk_speed: float = 100


func Enter() -> void:
	var animation_name = self.name.to_lower() + "_" + get_direction_name()
	animation.play(animation_name)


func Update(delta: float) -> void:
	var moving_direction = Input.get_vector(_actions.left, _actions.right, _actions.up, _actions.down)
	print(moving_direction)
	
	if moving_direction == Vector2.ZERO:			# No movement - transition to Idle
		transition_requested.emit(self, "idle", _direction)
	elif moving_direction.x and moving_direction.y: # Bidirecional movement - ignore (gameboy feel)
		return
	elif moving_direction != _direction:			# Different movement - update direction and animation
		_direction = moving_direction
		var animation_name = self.name.to_lower() + "_" + get_direction_name()
		animation.play(animation_name)


func Physics_update(delta: float) -> void:
	_player.velocity = _direction * walk_speed
	_player.move_and_slide()
