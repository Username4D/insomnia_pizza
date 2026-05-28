extends Node2D

@export var map: Node
@export var player: Node

signal shop_cutscene
signal pizzeria_cutscene

func _ready() -> void:
	$map.player = $player_character
	$shop_entry.interacted.connect(func(): shop_cutscene.emit())
	$pizzeria_entry.interacted.connect(func(): pizzeria_cutscene.emit())
