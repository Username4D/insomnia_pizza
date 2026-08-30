extends state

var speed = 140
var grabbed_item: Node = null
var map_open = false

func physics_process(_delta: float) -> void:
	object.get_node("%coins_display").text = str(player_stats_handler.coins) + " $"
	
	object.get_node("%minimap").player_position = object.position
	
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	object.move_and_collide(input.normalized() * speed * _delta)
	object.get_node("hitbox").disabled = false
	
	var interactables = []
	for i in object.get_node("interaction_area").get_overlapping_bodies() + object.get_node("interaction_area").get_overlapping_areas():
		if i.is_in_group("interactable"):
			interactables.append(i)
	object.get_node("%interaction_hint").visible = len(interactables) > 0
	
	if Input.is_action_just_pressed("ui_interact"):
		var objects = object.get_node("interaction_area").get_overlapping_bodies() + object.get_node("interaction_area").get_overlapping_areas()
		for i in objects:
			if i.is_in_group("car"):
				print("car")
				i.is_driven = true
				i.driver = object
				switch_state.emit("driving", {"car": i, "map_open": map_open})
				break
			if i.is_in_group("grabable_item") and grabbed_item == null:
				print("grabbed ", i.name)
				i.grabbed.emit(object)
				grabbed_item = i
				break
			if i.is_in_group("interaction_area"):
				i.interaction.emit()
				print("i_area", i.name)
			if grabbed_item != null:
				print("ungrabbed")
				grabbed_item.ungrabbed.emit(object)
				grabbed_item = null
				break
	
	if grabbed_item:
		grabbed_item.position = object.get_node("item_spot").global_position
	
	if Input.is_action_just_pressed("ui_open_map"):
		map_open = !map_open
		if !map_open:
			object.get_node("%minimap_container").position = Vector2(384, -288)
			object.get_node("%minimap_container").size = Vector2(160, 160)
		else:
			object.get_node("%minimap_container").position = Vector2(-288, -288)
			object.get_node("%minimap_container").size = Vector2(576, 576)
		
		
func exit() -> void:
	object.get_node("%interaction_hint").visible = false
	if grabbed_item:
		grabbed_item.ungrabbed.emit(object)
		grabbed_item = null

func enter(old, _data):
	if _data.has("map_open"):
		print(_data["map_open"])
		map_open = _data["map_open"]
		if !_data["map_open"]:
			object.get_node("%minimap_container").position = Vector2(384, -288)
			object.get_node("%minimap_container").size = Vector2(160, 160)
		else:
			object.get_node("%minimap_container").position = Vector2(-288, -288)
			object.get_node("%minimap_container").size = Vector2(576, 576)
