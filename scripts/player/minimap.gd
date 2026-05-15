extends SubViewport

@export var player_position = Vector2(0,0)
@export var map_open = true
var marker = preload("res://scenes/quest_marker.tscn")

func create_marker(marker_position: Vector2) -> Node:
	var new_marker = marker.instantiate()
	new_marker.position = marker_position
	self.add_child(new_marker)
	return new_marker

func _process(delta: float) -> void:
	$Camera2D.position = player_position
