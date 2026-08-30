extends Area2D

signal interacted

@export var do_queue_free = true

signal interaction

func _ready() -> void:
	self.interaction.connect(func(): interacted.emit())
	if do_queue_free: self.interacted.connect(queue_free)
