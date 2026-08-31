extends ColorRect

func _ready() -> void:
	time_to_string(player_stats_handler.time)

func time_to_string(time: float):
	var milliseconds = roundi((time - floor(time)) * 100)
	var seconds = floori(time) % 60
	var minutes = floori(time / 60)
	var final_string: String = ""
	%minutes.text = str(minutes) if str(minutes).length() != 1 else "0" + str(minutes)
	%seconds.text = str(seconds) if str(seconds).length() != 1 else "0" + str(seconds)
	%milliseconds.text = str(milliseconds) if str(milliseconds).length() != 1 else "0" + str(milliseconds)
	
