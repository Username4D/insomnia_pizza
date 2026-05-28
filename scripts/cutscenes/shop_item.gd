extends Control

@export var title: String
@export var price: int
@export var texture: Texture2D
@export var description: String
@export var item_name: String

signal buy(node: Node)

func _on_button_mouse_entered() -> void:
	$info_panel.visible = true

func _on_button_mouse_exited() -> void:
	$info_panel.visible = false

func _ready() -> void:
	$shop_item.texture = texture
	$info_panel/title.text = "%s  -  %d$" % [title, price]
	$info_panel/description.text = "%s (%d owned)" % [description, player_stats_handler.inventory[item_name]]
	
func _process(delta: float) -> void:
	$info_panel/description.text = "%s (%d owned)" % [description, player_stats_handler.inventory[item_name]]

func _on_button_pressed() -> void:
	buy.emit(self)
