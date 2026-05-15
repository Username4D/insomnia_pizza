extends Node

class_name state

@export var object: Node

signal switch_state(next_state: String, data: Dictionary)

func input(_event: InputEvent) -> void:
	pass

func process(_delta: float) -> void:
	pass

func physics_process(_delta: float) -> void:
	pass

func enter(_old_stage: String, _data: Dictionary):
	pass

func exit() -> void:
	pass
