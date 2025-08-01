class_name Room
extends Node2D


func _ready() -> void:
	if NavigationManager.spawn_door_tag != null:
		_on_level_spawn(NavigationManager.spawn_door_tag)

func _on_level_spawn(destination_tag: String) -> void:
	var door_path = "Doors/Door_" + destination_tag
	var door = get_node(door_path) as Door
	
	print("Door: ", door.spawn.global_position)
	NavigationManager.trigger_player_spawn(
		door.spawn.global_position, door.get_spawn_direction()
	)
	
