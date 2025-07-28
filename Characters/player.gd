class_name Player
extends CharacterBody2D
## Proxy-like class to deal with the players input or output data   


func _ready() -> void:
	NavigationManager.player_spawned.connect(_on_spawn)


func _on_spawn(p_position: Vector2, p_direction: String) -> void:
	self.global_position = p_position
	
	var animation = $AnimationPlayer
	var animation_name = "idle_" + p_direction
	animation.play(animation_name)
	animation.stop()
