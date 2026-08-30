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
	player_stats_handler.current_quest = quest_node
	await quest_node.completed
	player_stats_handler.done_quests += 1
	player_stats_handler.current_quest = null

func _on_gameplay_world_shop_cutscene() -> void:
	create_cutscene(load("res://scenes/cutscenes/shop.tscn").instantiate(), {})

func _on_gameplay_world_pizzeria_cutscene() -> void:
	print("wow")
	var new_quest = await create_cutscene(load("res://scenes/cutscenes/pizzeria.tscn").instantiate(), {})
	if new_quest["quest"] != null:
		load_quest(new_quest["quest"])
