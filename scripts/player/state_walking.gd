extends state

var speed = 140
var grabbed_item: Node = null

func physics_process(_delta: float) -> void:
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	object.move_and_collide(input.normalized() * speed * _delta)
	object.get_node("hitbox").disabled = false
	
	var interactables = []
	for i in object.get_node("interaction_area").get_overlapping_bodies():
		if i.is_in_group("interactable"):
			interactables.append(i)
	object.get_node("Label").visible = len(interactables) > 0
	
	if Input.is_action_just_pressed("ui_interact"):
		var objects = object.get_node("interaction_area").get_overlapping_bodies() + object.get_node("interaction_area").get_overlapping_areas()
		for i in objects:
			if i.is_in_group("car"):
				print("car")
				i.is_driven = true
				i.driver = object
				switch_state.emit("driving", {"car": i})
				break
			if i.is_in_group("grabable_item") and grabbed_item == null:
				print("grabbed ", i.name)
				i.grabbed.emit(object)
				grabbed_item = i
				break
			if grabbed_item != null:
				print("ungrabbed")
				grabbed_item.ungrabbed.emit(object)
				grabbed_item = null
				break
	
	if grabbed_item:
		grabbed_item.position = object.get_node("item_spot").global_position

func exit() -> void:
	object.get_node("Label").visible = false
	if grabbed_item:
		grabbed_item.ungrabbed.emit(object)
		grabbed_item = null
