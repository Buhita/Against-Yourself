extends Node2D

onready var timer := $Timer
onready var label := $CustomLabel
onready var perfilp = get_node("/root/Globales")

func _on_Puerta_body_entered(body):
	$Label.save_time()

func _on_Puerta1_body_entered(body):
	$Label.save_time()

func _on_Area2D_body_entered(body):
	$Label.save_time()

func _on_Puerta2_body_entered(body):
	$Label.save_time()

func _on_Atras2_body_entered(body):
	$Label.save_time()

func _on_Enemigo1_boss_die():
	$Label.save_time()
