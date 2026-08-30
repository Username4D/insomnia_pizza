extends "res://scripts/map/quest_interaction_area.gd"


func _on_interaction() -> void:
	interacted.emit()
	print("int")
