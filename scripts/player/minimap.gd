extends SubViewport

@export var player_position = Vector2(0,0)

func _process(delta: float) -> void:
	$Camera2D.position = player_position
