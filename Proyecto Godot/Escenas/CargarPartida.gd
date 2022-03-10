extends Node2D

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().change_scene("res://Menu Principal.tscn")

func _on_Atrs_pressed():
	get_tree().change_scene("res://Menu Principal.tscn")
