extends KinematicBody2D

var a = 2
var timer = Timer.new()

onready var sonido_escudo = get_node("/root/SonidoEscudo")

func die():
	queue_free()

func _process(delta):
	$AnimatedSprite.play("escudo1")
	if Input.action_release("protegerse"):
		die()

func _ready():
	$AnimatedSprite.play("escudo1")
	if Input.action_release("protegerse"):
		die()

func _on_Jugador_protect(escudo, location):
	sonido_escudo.play()
	$Timer.start()

func _on_Timer_timeout():
	self.position = Vector2(-2407,-1079)
