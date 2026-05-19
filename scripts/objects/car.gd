extends CharacterBody2D

@export var is_driven = false
@export var driver: Node

var max_speed = 400
const acceleration = 200
@export var speed = 0

var turning_radius = 1.2
@export var turn = 0

func _physics_process(delta: float) -> void:
	if is_driven:
		if Input.is_action_pressed("ui_up"):
			speed = move_toward(speed, max_speed, acceleration * delta)
		else:
			speed = move_toward(speed, 0, acceleration * 1.5 * delta)
		if Input.is_action_pressed("ui_down"):
			turning_radius = 0.75
			speed = move_toward(speed, -max_speed * 0.5, acceleration * 2 * delta)
	
		else:
			turning_radius = 1.2
			
		
		turn = move_toward(turn, Input.get_axis("ui_left", "ui_right") * turning_radius, delta * 4)
		if speed < 200:
			self.rotation_degrees += turn  * speed / 200
		else:
			self.rotation_degrees += turn
		var collision
		if Input.is_action_pressed("ui_down") and abs(turn) > 0.5:
			collision = move_and_collide(Vector2(-turn * speed / 2 * delta, -speed * delta).rotated(self.rotation))
		else:
			collision = move_and_collide(Vector2(0, -speed * delta).rotated(self.rotation))
		if collision:
			speed = move_toward(speed, 0, acceleration * 6 * delta)
		driver.position = self.position
