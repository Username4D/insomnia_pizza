extends state

var car: Node

func enter(_old_stage: String, _data: Dictionary):
	object.get_node("hitbox").disabled = true
	car = _data["car"]

func exit() -> void:
	object.get_node("hitbox").disabled = false
	car.speed = 0
	car.turn = 0
	car.is_driven = false
	car.driver = null

func physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_interact"):
		switch_state.emit("walking", {})
