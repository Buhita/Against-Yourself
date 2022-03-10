extends Area2D

onready var rayCast = $RayCast2D
var facingDir = Vector2()
var danio : int = 1
var interactDist : int = 70

var speed = 600

var Enemigo1 = preload("res://Escenas/Enemigo1.tscn")
var Enemigo2 = preload("res://Escenas/Enemigo2.tscn")
var Jefe1 = preload("res://Escenas/Jefe1.tscn")

func die ():
	queue_free()

func _process(delta):
	move_local_x(speed * delta)
	rayCast.cast_to = facingDir * interactDist
	#emit_signal("disparo")
	if rayCast.is_colliding():
		if rayCast.get_collider() is KinematicBody2D and rayCast.get_collider().has_method("take_damage"):
			rayCast.get_collider().take_damage(danio)
			$AnimatedSprite.play("choque")
			die()
