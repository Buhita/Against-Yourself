extends AnimatedSprite

func _ready():
	var file = File.new()
	if file.file_exists("user://save_nombre3.txt"):
		visible = not visible
