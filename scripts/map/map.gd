extends Node2D

@export var player: Node

func _process(delta: float) -> void:
	if player:
		$map_overhang.material.set_shader_parameter("player_world_pos", player.global_position)
