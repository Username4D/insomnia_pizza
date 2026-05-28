extends cutscene

func _start(_data) -> void:
	for i in $items.get_children():
		i.buy.connect(buy)
	if player_stats_handler.inventory["flashlight"] > 0:
		$items/flashlight.queue_free()

func buy(object: Node):
	if player_stats_handler.coins >= object.price:
		player_stats_handler.coins -= object.price
		player_stats_handler.inventory[object.item_name] += 1
	if player_stats_handler.inventory["flashlight"] > 0:
		if $items.has_node("flashlight"):
			$items/flashlight.queue_free()

func _ready() -> void:
	_start({})

func _process(delta: float) -> void:
	$cash_amount.text = "%d$" % player_stats_handler.coins

func _on_exit_button_pressed() -> void:
	exit.emit({})
