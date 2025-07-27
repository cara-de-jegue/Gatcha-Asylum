class_name Door
extends Area2D

@export var _destination_room_tag: String
@export var _destination_door_tag: String
@export var _spawn_direction: String

@onready var spawn: Marker2D = $Spawn

func get_spawn_direction() -> String:
	return _spawn_direction

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	
	NavigationManager.go_to_level(_destination_room_tag, _destination_door_tag)
