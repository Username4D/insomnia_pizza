extends SubViewport

@export var player_position = Vector2(0,0)
@export var map_open = true

func _process(delta: float) -> void:
	$Camera2D.position = player_position
