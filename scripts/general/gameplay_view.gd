extends Node2D

func create_cutscene(scene: cutscene, _data):
	$cutscenes.add_child(scene)
	%gameplay_world.process_mode = Node.PROCESS_MODE_DISABLED
	%gameplay_world.visible = false
	scene.start.emit(_data)
	var data = await scene.exit
	%gameplay_world.process_mode = Node.PROCESS_MODE_INHERIT
	%gameplay_world.visible = true
	scene.queue_free()
	if data:
		return data
	else:
		return {}
	
func load_quest(quest_node: quest):
	quest_node.map = $gameplay_world.map
	quest_node.player = $gameplay_world.player
	self.add_child(quest_node)

func _ready() -> void:
	var example_quest = load("res://scenes/quests/individual_quests/level_0/example_quest.tscn").instantiate()
	load_quest(example_quest)
