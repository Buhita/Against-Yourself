extends Camera2D

onready var target = get_node("/root/Node2D/Jugador")
 
func _process (delta):
	position = target.position
