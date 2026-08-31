extends Node2D


var timer_active = true
var current_time = 0

func create_cutscene(scene: cutscene, _data):
	$cutscenes.add_child(scene)
	%gameplay_world.process_mode = Node.PROCESS_MODE_DISABLED
	%gameplay_world.visible = false
	timer_active = false
	scene.start.emit(_data)
	var data = await scene.exit
	%gameplay_world.process_mode = Node.PROCESS_MODE_INHERIT
	%gameplay_world.visible = true
	scene.queue_free()
	timer_active = true
	if data:
		return data
	else:
		return {}

func _process(delta: float) -> void:
	if timer_active: current_time += delta
	time_to_string(current_time)

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
	var new_quest = await create_cutscene(load("res://scenes/cutscenes/pizzeria.tscn").instantiate(), {})
	if new_quest["quest"] != null:
		load_quest(new_quest["quest"])

func time_to_string(time: float):
	var milliseconds = roundi((time - floor(time)) * 100)
	var seconds = floori(time) % 60
	var minutes = floori(time / 60)
	var final_string: String = ""
	%minutes.text = str(minutes) if str(minutes).length() != 1 else "0" + str(minutes)
	%seconds.text = str(seconds) if str(seconds).length() != 1 else "0" + str(seconds)
	%milliseconds.text = str(milliseconds) if str(milliseconds).length() != 1 else "0" + str(milliseconds)
	
