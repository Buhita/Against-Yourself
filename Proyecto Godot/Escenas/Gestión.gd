extends Node2D

func _ready():
	pass

func _on_Volver_pressed():
	get_tree().change_scene("res://Escenas/SelecciónPerfil.tscn")

func _on_Enviar_pressed():
	var file = File.new()
	var file2 = File.new()
	file.open("user://gu.dat", File.READ)
	file2.open("user://gc.dat", File.READ)
	
	if file.get_line() == $Usuario.text and file2.get_line() == $Contra.text:
		get_tree().change_scene("res://Escenas/Datos.tscn")
	else:
		$Error.text = "Usuario o contraseña incorrectos."
