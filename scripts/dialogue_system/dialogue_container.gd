extends Control

@export var initial_part: DialoguePart
@export var current_dialogue_part: DialoguePart

func load_dialogue_part(part: DialoguePart):
	for i in %options.get_children():
		i.visible = false
	var arr = part.answers
	for i in range(0, len(arr)):
		var n = part.answers[i]
		%options.get_child(i).visible = true
		%options.get_child(i).get_node("Label").text = n.answer
		for f in %options.get_child(i).pressed.get_connections():
			%options.get_child(i).pressed.disconnect(f["callable"])
		if n.dialogue_part != null:
			%options.get_child(i).pressed.connect(func (): load_dialogue_part(n.dialogue_part))
		else:
			%options.get_child(i).pressed.connect(end)
	$character_text/Label.text = part.text
	current_dialogue_part = part
func _ready() -> void:
	await get_tree().process_frame
	load_dialogue_part(initial_part)

func end():
	pass
