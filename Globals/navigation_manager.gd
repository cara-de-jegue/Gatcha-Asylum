# Singletons don't have class_name here
extends Node

signal player_spawned

const test1 = preload("res://Rooms/test_room.tscn")
const test2 = preload("res://Rooms/test_room_2.tscn")

var spawn_door_tag

func go_to_level(level_tag: String, destination_tag: String) -> void:
	var scene_to_load
	
	match level_tag:
		"Test1":
			scene_to_load = test1
		"Test2":
			scene_to_load = test2
	
	if scene_to_load != null:
		spawn_door_tag = destination_tag
		get_tree().change_scene_to_packed(scene_to_load)

func trigger_player_spawn(p_position: Vector2, p_direction: String) -> void:
	player_spawned.emit(p_position, p_direction)
	pass
