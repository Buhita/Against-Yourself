extends KinematicBody2D

var vida : int = 7
var vidaMax : int = 7
 
var velocidad : int = 400
 
var danio : int = 1
var attackRate : float = 1.3
var attackDist : int = 120
var chaseDist : int = 600 

onready var timer = $Timer
onready var sonido_impacto = get_node("/root/SonidoEnemigoD")
onready var sonido_muere = get_node("/root/SonidoMuereEnemigo")

func _ready():
	$AnimationPlayer.play("Standby")
	timer.wait_time = attackRate
	timer.start()

func _physics_process (delta):
	var target = get_node("/root/Node2D/Jugador")
	var dist = position.distance_to(target.position)

	if dist > attackDist and dist < chaseDist:
		var vel = (target.position - position).normalized()
		$AnimationPlayer.stop()
		move_and_slide(vel * velocidad)

func _on_Timer_timeout():
	var target = get_node("/root/Node2D/Jugador")
	var dist = position.distance_to(target.position)
	
	if position.distance_to(target.position) <= attackDist:
		target.take_damage(danio)

func take_damage (dmgToTake):
	vida -= dmgToTake
	$AnimationPlayer.play("DanioE")
	sonido_impacto.play()
	if vida <= 0:
		sonido_muere.play()
		die()
 
func die ():
	var start_color = Color(1.0, 1.0, 1.0, 1.0)
	var end_color = Color(1.0, 1.0, 1.0, 0.0)
	$Tween.interpolate_property(self, "modulate", start_color, end_color, 1.0)
	if not $Tween.is_active():
		$Tween.start()
	yield(get_tree().create_timer(2.0), "timeout")
	queue_free()
