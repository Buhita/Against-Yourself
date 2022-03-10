extends Button

var master_sound = AudioServer.get_bus_index("Master")

func _ready():
	pass

func _process(delta):
	if AudioServer.is_bus_mute(master_sound):
		text = "Encender"
	else:
		text = "Apagar"
