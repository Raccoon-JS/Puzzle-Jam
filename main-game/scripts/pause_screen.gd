extends ColorRect

var pause = false

func _ready():
	set_process(true)
	pass

func _input(event):
	if event.is_action_pressed("pause"):
		pause = not pause
	if Input.is_key_pressed(KEY_1):
		get_tree().paused = false
		global.goto_scene("res://scenes/menu.tscn")
	if Input.is_key_pressed(KEY_2):
		get_tree().quit()
	pass

func _process(delta):
	if delta:
		if pause:
			visible = true
			get_tree().paused = true
		else:
			visible = false
			get_tree().paused = false
	pass