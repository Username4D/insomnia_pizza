extends Node

class_name quest_part

var map: Node
var player: Node
var quest: Node

@export var part_text: String

signal started(_map, _player, _quest)
signal exit()

func _ready() -> void:
	started.connect(start)

func start(_map, _player, _quest):
	pass

func process(delta: float) -> void:
	pass

func physics_process(delta: float) -> void:
	pass

func input(event: InputEvent) -> void:
	pass

func finish():
	pass
