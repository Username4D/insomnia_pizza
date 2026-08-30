extends Node

class_name quest

@onready var quests = self.get_children()
@export var map: Node
@export var player: Node

@export var quest_name: String
@export var part_text: String

@export var dialogue_text: String


var current_quest_part: quest_part
var progress = 0

signal completed

func _enter_tree() -> void:
	await get_tree().process_frame
	quests[0].started.emit(map, player, self)
	part_text = quests[0].part_text
	quests[0].exit.connect(next)

func _physics_process(delta: float) -> void:
	if current_quest_part:
		current_quest_part.physics_process(delta)

func _process(delta: float) -> void:
	if current_quest_part:
		current_quest_part.process(delta)

func _input(event: InputEvent) -> void:
	if current_quest_part:
		current_quest_part.input(event)

func next():
	progress += 1
	if progress >= len(quests):
		completed.emit()
		self.queue_free()
	else:
		print(progress)
		quests[progress].started.emit(map, player, self)
		quests[progress].exit.connect(next)
		part_text = quests[progress].part_text
