extends Control

@export var initial_part: DialoguePart
@export var current_dialogue_part: DialoguePart
@export var data: Dictionary = {}

signal dialogue_finished(_data)

func load_dialogue_part(part: DialoguePart):
	for i in %options.get_children():
		i.visible = false
	var arr = part.answers
	
	for i in len(part.text):
		$character_text/Label.text = part.text.substr(0, i)
		await get_tree().create_timer(0.04).timeout
		if Input.is_action_just_pressed("ui_accept"):
			#print("w")
			break
	$character_text/Label.text = part.text
	
	for i in range(0, len(arr)):
		var n = part.answers[i]
		%options.get_child(i).visible = true
		%options.get_child(i).get_node("Label").text = n.answer
		for f in %options.get_child(i).pressed.get_connections():
			%options.get_child(i).pressed.disconnect(f["callable"])
		if n.dialogue_part != null:
			%options.get_child(i).pressed.connect(func (): load_dialogue_part(n.dialogue_part))
		else:
			%options.get_child(i).pressed.connect(func (): end(n.data))
	$character_text/Label.text = part.text
	current_dialogue_part = part

func end(_data):
	dialogue_finished.emit(_data)
	self.queue_free()

func start():
	load_dialogue_part(initial_part)
