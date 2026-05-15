extends Node

class_name grabable_item

signal grabbed(object: Node)
signal ungrabbed(object: Node)

func _ready() -> void:
	grabbed.connect(_grabbed)

func _grabbed(object: Node):
	pass

func _ungrabbed(object: Node):
	pass
