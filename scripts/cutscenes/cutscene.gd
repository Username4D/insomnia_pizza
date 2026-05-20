extends Control

class_name cutscene

signal exit(_data)
signal start(_data)

func _ready() -> void:
	start.connect(_start)

func _start(_data) -> void:
	pass
