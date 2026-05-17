extends Control



func _process(delta: float) -> void:
	if self.get_parent():
		if self.get_parent().map_open:
			$quest_map_hint.visible = true
			if $quest_marker.global_position.clamp(self.get_parent().get_node("Camera2D").position - Vector2(800, 800), self.get_parent().get_node("Camera2D").position + Vector2(800, 800)) == $quest_marker.global_position:
				$quest_map_hint.visible = false

			else:
				$quest_map_hint.visible = true
				$quest_map_hint.global_position = $quest_marker.global_position.clamp(self.get_parent().get_node("Camera2D").position - Vector2(700, 700), self.get_parent().get_node("Camera2D").position + Vector2(700, 700))
				$quest_map_hint.look_at($quest_marker.global_position)
		else:
			$quest_map_hint.visible = false
