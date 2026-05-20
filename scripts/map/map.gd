extends Node2D

@export var player: Node

var interaction_area = preload("res://scenes/quest_interaction_area.tscn")

func _process(delta: float) -> void:
	if player:
		$map_overhang.material.set_shader_parameter("player_world_pos", player.global_position)

func create_interaction_area(pos: Vector2) ->  Node:
	var new = interaction_area.instantiate()
	new.position = pos
	$interaction_areas.add_child(new)
	return new
