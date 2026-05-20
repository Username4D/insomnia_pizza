extends state

var car: Node
var map_open = false

func enter(_old_stage: String, _data: Dictionary):
	object.get_node("hitbox").disabled = true
	car = _data["car"]
	if _data.has("map_open"):
		map_open = _data["map_open"]
		if !map_open:
			object.get_node("%minimap_container").position = Vector2(384, -288)
			object.get_node("%minimap_container").size = Vector2(160, 160)
		else:
			object.get_node("%minimap_container").position = Vector2(-288, -288)
			object.get_node("%minimap_container").size = Vector2(576, 576)
	
func exit() -> void:
	object.get_node("hitbox").disabled = false
	car.speed = 0
	car.turn = 0
	car.is_driven = false
	car.driver = null

func physics_process(_delta: float) -> void:
	object.get_node("%minimap").player_position = object.position
	if Input.is_action_just_pressed("ui_interact"):
		switch_state.emit("walking", {"map_open": map_open})
	
	if Input.is_action_just_pressed("ui_open_map"):
		map_open = !map_open
		if !map_open:
			object.get_node("%minimap_container").position = Vector2(384, -288)
			object.get_node("%minimap_container").size = Vector2(160, 160)
		else:
			object.get_node("%minimap_container").position = Vector2(-288, -288)
			object.get_node("%minimap_container").size = Vector2(576, 576)
		
