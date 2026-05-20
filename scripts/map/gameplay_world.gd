extends Node2D

@export var map: Node
@export var player: Node

func _ready() -> void:
	$map.player = $player_character
