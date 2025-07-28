class_name PlayerIdle
extends State


func Enter() -> void:
	var animation_name = self.name.to_lower() + "_" + get_direction_name()
	animation.play(animation_name)


func Update(delta: float) -> void:
	if Input.get_vector(_actions.left, _actions.right, _actions.up, _actions.down):
		transition_requested.emit(self, "walk", _direction)


func Handle_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed(_actions.action):
		pass
