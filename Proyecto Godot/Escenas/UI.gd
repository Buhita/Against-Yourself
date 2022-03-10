extends Control

onready var barraVida : TextureProgress = get_node("BG/Vida")
onready var barraMagia : TextureProgress = get_node("BG/Magia")

func actualizar_barra_vida (vida, vidaMax):
	barraVida.value = (100 / vidaMax) * vida
	
func actualizar_barra_magia (magia, magiaMax):
	barraMagia.value = (100 / magiaMax) * magia
