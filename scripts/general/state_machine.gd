class_name state_machine extends Node

@export var initial_state: state
@export var current_state: state
@export var object: Node
func _ready() -> void:
	current_state = initial_state
	for i in self.get_children():
		if i is state:
			i.switch_state.connect(switch_state)
	await object.ready
	current_state.enter("", {})

func switch_state(next_stage: String, data: Dictionary):
	for i in self.get_children():
		if i is state and i.name == next_stage:
			var old_state = current_state
			await current_state.exit()
			current_state = i
			current_state.enter(old_state.name, data)

func _process(delta: float) -> void:
	current_state.process(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_process(delta)

func _input(event: InputEvent) -> void:
	current_state.input(event)
