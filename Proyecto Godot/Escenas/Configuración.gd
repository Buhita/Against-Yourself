extends Node2D

var master_sound = AudioServer.get_bus_index("Master")

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().change_scene("res://Menu Principal.tscn")

func _on_Volver_pressed():
	get_tree().change_scene("res://Menu Principal.tscn")

func _on_Pantalla_completa_pressed():
	OS.window_fullscreen = !OS.window_fullscreen


func _on_MusicaOnOff_pressed():
	if AudioServer.is_bus_mute(master_sound):
		AudioServer.set_bus_mute(master_sound, false)
		$MusicaOnOff.text = "Apagar"
	else:
		AudioServer.set_bus_mute(master_sound, true)
		$MusicaOnOff.text = "Encender"
	
