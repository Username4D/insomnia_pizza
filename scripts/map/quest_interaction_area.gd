extends Area2D

signal interacted

signal interaction

func _on_interaction() -> void:
	interacted.emit()
	self.queue_free()
